#!/bin/sh
# name runjar.sh
# desc 针对在docker上启动springboot的脚本进行相关改造
# create by maning at 2020-05-30
# mail=man003@163.com

version=V1.0.3-20210617

##################################################
# config area
##################################################
# 建议在 config/env 文件中配置,不要直接该脚本中修改
# jar包名 
jarName=xx.jar

# 延迟启动多少秒
# 之所以要延迟启动,是因为程序有可能配置开机自启动,此时机器有可能还没有连上网,所以等一段时间再启动
delaySeconds=0


#specify JAVA_HOME
#JAVA_HOME=/home/dw/fuboot/jdk/jdk1.8.0_91

#要求的 java 最低版本
MIN_JAVA_VERSION=1.8

####################################


##################################################
# functions
##################################################
usage() {
 cat <<EOF
DESC: run java jar program
Usage: $SHELL_NAME [-v]  parameters
    start [args]                  |start program
    stop                          |stop program
    status                        |show program status
    restart                       |restart program
    show                          |show env
    -v                            |echo verbose info while run
EOF
}

#function start {
start() {
    #process=`ps -ef|grep $jarAbsolutePath |grep -v "grep"|awk '{print $2}'`
    #echo "wait for $delaySeconds s"
    sleep $delaySeconds
    echo "start ..."
    if [ "$IS_VERBOSE"X = "true"X ] ;then
        echo "JVM_OPT_DOCKER:" $JVM_OPT_DOCKER
        echo "PROGRAM_OPT_DOCKER:" $PROGRAM_OPT_DOCKER
        echo "$JAVA $JVM_OPT $JVM_OPT_DOCKER -jar $jarAbsolutePath $PROGRAM_OPT $ARGS $PROGRAM_OPT_DOCKER" 
    fi

    $JAVA $JVM_OPT $JVM_OPT_DOCKER  -jar $jarAbsolutePath $PROGRAM_OPT $ARGS $PROGRAM_OPT_DOCKER

    # TODO pid这块可以废弃了,因为docker中不需要记录进程号了,关程序直接用docker命令关
    # TODO 目前不知道如何写pid 
    # 因为现在不用nohup了 也不用&了,所以下面的2句是不执行的 
    # 如果上面的命令最后加上 & 则可以获取pid 则又不输出日志到控制台了,我也不喜欢. 而且我发现上面用&后 用jobs 找不到job不知道为什么呢.
    #pid=$!
    #echo $pid>$PID_FILE
}

# TODO 这部分不需要了 因为docker中不需要关闭程序了 但可以先放着
#function stop {
stop() {
    if [ -f $PID_FILE ]
    then
        pid=$(cat $PID_FILE)
        kill -9 $pid
        rm -rf $PID_FILE
        echo killed $pid
        echo `date  +"%Y-%m-%d %H:%M:%S"` killed process $pid
    else
        echo "$PID_FILE does not exist, process is not running"
    fi
}

#function status {
status() {
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

#function restart {
restart() {
    stop
    echo
    start
}

#function show {
show() {
    echo "java: $JAVA"
    echo "jarName: $jarName"
    echo "delaySeconds: $delaySeconds"
    echo "version:" $version
}

# java 最低版本检查
java_version_check() {
  readonly java_version=$("$JAVA" -version 2>&1 | awk -F '"' '/version/ {print $2}')
  if [ "$java_version" == "" ]; then
    echo
    echo ERROR:No java installations was detected.
    echo
    exit 1
  elif [ "$java_version" \< "$MIN_JAVA_VERSION" ]; then
    echo
    echo ERROR:The java installation you have is not up to date
    echo $jarName requires at least version "$MIN_JAVA_VERSION"+, you have
    echo version $java_version
    echo
    echo
    exit 1
  fi
}

# 做日志的软链接
log_soft_link() {
  HOSTNAME=${HOSTNAME:-defaultHostname}
  local realLogsPath=$BASE_PATH/applogs/logs-${HOSTNAME}
  mkdir -p $realLogsPath
  ln -s $realLogsPath $BASE_PATH/logs
}

###  ------------------------------- ###
###  Main script                     ###
###  ------------------------------- ###

# 脚本相关路径
#set -eux
echo "$@"
SHELL_DIR_PATH=$(cd $(dirname "$0");pwd)
BASE_PATH=`dirname $SHELL_DIR_PATH`;
SHELL_NAME=`basename $0`
SHELL_ABSOLUTE_PATH=$SHELL_DIR_PATH/$SHELL_NAME
CONFIG_PATH=$BASE_PATH/config

cd $BASE_PATH

# 初始化配置
[ -f $CONFIG_PATH/env  ] && . $CONFIG_PATH/env


jarAbsolutePath=$BASE_PATH/lib/$jarName
#PID_DIR=/tmp
#[ -w $PID_DIR ] || mkdir -p $PID_DIR
#PID_FILE=$PID_DIR/$jarName.pid
PID_FILE=$BASE_PATH/pid


# Which java to use
if [ -z "$JAVA_HOME" ]; then
  JAVA=`which java`
else
  JAVA="$JAVA_HOME/bin/java"
fi

# check java min version
java_version_check

# log soft link
log_soft_link

# jvm相关路径
JVM_CONFIG=$BASE_PATH/config/jvm.config
if [ -e $JVM_CONFIG ]
then
    JVM_OPT=`cat $JVM_CONFIG |grep -v "^#" |xargs`
fi


#program 相关配置
PROGRAM_CONFIG=$BASE_PATH/config/program.config
if [ -e $PROGRAM_CONFIG ]
then
    PROGRAM_OPT=`cat $PROGRAM_CONFIG |grep -v "^#" |xargs`
fi

while getopts :a:b:v opt
do
  case "$opt" in
     a) echo "found the -a option";;
     b) echo "found the -b option,with value $OPTARG";;
     v) echo "found the -v option"
        IS_VERBOSE=true;;
     *) echo "unknown option:$opt";;
  esac
done

# 注 以下部分用于处理参数部分
# 因为OPTIND指向当前正在处理的选项 减1表示把前面的参数移除
# 如果 -a -c tes1 test2 则当前optind为3 所以要把前面的2个参数移除。
# 如果 -a -c -- test1 test2则optind为4 说明getopts会自动处理--的情况
# 在docker的openjdk镜像中发现不认$[]这个命令,所以改成了双圆括号
#shift $[ $OPTIND -1 ]
shift $(( $OPTIND -1 ))


para1=$1
# 跳过第1个参数如start, 然后把后面的参数保存下来,执行java命令时传过去,有可能输入 ./runjar.sh start --spring.profiles.active=dev 这样的命令
shift
ARGS="$@"

case "$para1" in
  start)
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
