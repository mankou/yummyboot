:: windows上启动脚本runjar.bat的配置文件
:: 设置jar包名
set jarName=yummyboot-0.0.1-SNAPSHOT.jar

::设置虚拟机参数 
::set JAVA_OPTS=-Xms2g -Xmx2g -XX:PermSize=128M -XX:MaxPermSize=128M -Xmn128M -XX:+UseParNewGC -XX:+UseConcMarkSweepGC
::如果springboot打包时采用jar包分离的方式 则使用-Dloader.path=lib
set JAVA_OPTS=-Xms256m -Xmx512m -Dloader.path=lib

::设置一些程序参数
set PROGRAM_CONFIG=--spring.profiles.active=pro

