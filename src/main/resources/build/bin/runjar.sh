#!/bin/sh
# name runjar.sh
# desc 运行jar包的脚本
# create by m-ning at 2017-04-22 13:26:18
# last modify by man003@163.com at 2019-09-18

# 特别要注意部署时的目录结构,runjar.sh必须在bin目录下,各种jar包必须在lib目录下 即使只有一个jar包也必须放在lib目录下
#├── bin
#│   └── runjar.sh
#├── lib
#│   └── xxx.jar
#├── config 
#│   └── jvm.config
#└── nohup.out


author=man003@163.com
version=V1-20190918

############配置区域##################
# 建议在 config/env 文件中配置,不要直接该脚本中修改

# jar包名 
jarName=xx.jar

# 延迟启动多少秒
# 之所以要延迟启动,是因为程序有可能配置开机自启动,此时机器有可能还没有连上网,所以等一段时间再启动
delaySeconds=0


#specify JAVA_HOME
#JAVA_HOME=/home/dw/fuboot/jdk/jdk1.8.0_91

####################################


usage() {
 cat <<EOM
DESC: run java jar program
Usage: $SHELL_NAME parameters
    start [extra_opts]            |start program
    stop                          |stop program
    status                        |show program status
    restart                       |restart program
    show                          |show env
EOM
}

###  ------------------------------- ###
###  Main script                     ###
###  ------------------------------- ###



# 脚本相关路径
SHELL_DIR_PATH=$(cd $(dirname "$0");pwd)
BASE_PATH=`dirname $SHELL_DIR_PATH`;
SHELL_NAME=`basename $0`
SHELL_ABSOLUTE_PATH=$SHELL_DIR_PATH/$SHELL_NAME
CONFIG_PATH=$BASE_PATH/config


# 初始化配置
[ -f $CONFIG_PATH/env  ] && . $CONFIG_PATH/env


jarAbsolutePath=$BASE_PATH/lib/$jarName
PID_DIR=/tmp
[ -w $PID_DIR ] || mkdir -p $PID_DIR
PID_FILE=$PID_DIR/$jarName.pid
NOHUP_FILE=$BASE_PATH/nohup.out


# Which java to use
if [ -z "$JAVA_HOME" ]; then
  JAVA=`which java`
else
  JAVA="$JAVA_HOME/bin/java"
fi


# jvm相关路径
JVM_CONFIG=$BASE_PATH/config/jvm.config
if [ -e $JVM_CONFIG ]
then
    JVM_OPT=`cat $JVM_CONFIG |grep -v "^#" |xargs`
fi

cd $BASE_PATH

function start {
  # 判断程序是否正在运行 如果正在运行不启动
    #process=`ps -ef|grep $jarAbsolutePath |grep -v "grep"|awk '{print $2}'`
    if [ -f $PID_FILE ]
    then
        echo "$PID_FILE exists,process is already running or crashed"
    else
        echo "wait for $delaySeconds s"
        sleep $delaySeconds
        echo "start ..."
        echo "$JAVA $JVM_OPT  -jar $jarAbsolutePath $EXTRA_OPTS"
        nohup $JAVA $JVM_OPT  -jar $jarAbsolutePath $EXTRA_OPTS  &
        pid=$!
        echo $pid>$PID_FILE
        echo started pid $pid
    fi
}

function stop {
    if [ -f $PID_FILE ]
    then
        pid=$(cat $PID_FILE)
        kill -9 $pid
        rm -rf $PID_FILE
        echo killed $pid
        echo `date  +"%Y-%m-%d %H:%M:%S"` killed process $pid >>$NOHUP_FILE
    else
        echo "$PID_FILE does not exist, process is not running"
    fi
}

function status {
    if [ -f $PID_FILE ] 
    then
        pid=$(cat $PID_FILE)
        if kill -0 $pid > /dev/null 2>&1; then
            echo $command already running as process $pid.
            exit 0
        fi
        echo "$PID_FILE exist, but process is not running!!!"
    else
        echo "$PID_FILE does not exist,process is not running!!!"
    fi
    exit $?
}

function restart {
    #$SHELL_ABSOLUTE_PATH stop
    #$SHELL_ABSOLUTE_PATH start
    stop
    echo
    start
}

function show {
    echo "java: $JAVA"
    echo "jarName: $jarName"
    echo "delaySeconds: $delaySeconds"
}


para1=$1
shift
EXTRA_OPTS="$@"

case "$para1" in
  start)
# 把第1个参数start过掉, 然后把后面的参数保存下来,执行java命令时传过去,有可能输入 ./runjar.sh start --spring.profiles.active=dev 这样的命令
        start
        ;;
  stop)
        stop
        ;;
  status)
        status
        ;;
  restart)
        restart
        ;;
  show)
      show
      ;;
  *)
        usage
        exit 0
        ;; 
esac
