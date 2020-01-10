@echo off
:: desc windows上启动jar包
:: 开发的初衷是用于配合启动基于springboot的jar包
:: create by maning at 2019-08-12
:: last modify at 2020-01-10
:: mail man003@163.com
:: version 1.0.1-20200110


::=================使用说明===========================
:: 在env.cmd 中配置相关信息 然后双击该脚本运行


::==================main bat==================================
echo 正在运行,请稍后....
echo batPath:%~dp0

::将当前路径切换到脚本所在路径 当使用相对路径时会用到 如在其它地方或者计划任务中运行脚本有可能找不到路径
cd %~dp0%\..

echo load env.cmd ...
call config\env.cmd

::start program
echo java  %JAVA_OPTS% -jar lib\%jarName% %PROGRAM_CONFIG%
java  %JAVA_OPTS% -jar lib\%jarName% %PROGRAM_CONFIG%
@pause


