:: windows�������ű�runjar.bat�������ļ�
:: ����jar����
set jarName=yummyboot-0.0.1-SNAPSHOT.jar

::������������� 
::set JAVA_OPTS=-Xms2g -Xmx2g -XX:PermSize=128M -XX:MaxPermSize=128M -Xmn128M -XX:+UseParNewGC -XX:+UseConcMarkSweepGC
::���springboot���ʱ����jar������ķ�ʽ ��ʹ��-Dloader.path=lib
set JAVA_OPTS=-Xms256m -Xmx512m -Dloader.path=lib

::����һЩ�������
set PROGRAM_CONFIG=--spring.profiles.active=dev

::set JAVA_HOME=z:\work\workToolsWindows\java\jdk1.8.0_60_64
::set PATH=%JAVA_HOME%\bin;%PATH%
if not exist "%JAVA_HOME%"\bin\java.exe (
  echo Error: JAVA_HOME is incorrectly set.
  goto :eof
)
