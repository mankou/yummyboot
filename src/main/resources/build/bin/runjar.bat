@echo off
:: desc windows������jar��
:: �����ĳ��������������������springboot��jar��
:: create by maning at 2019-08-12
:: last modify at 2020-01-10
:: mail man003@163.com
:: version 1.0.1-20200110


::=================ʹ��˵��===========================
:: ��env.cmd �����������Ϣ Ȼ��˫���ýű�����


::==================main bat==================================
echo ��������,���Ժ�....
echo batPath:%~dp0

::����ǰ·���л����ű�����·�� ��ʹ�����·��ʱ���õ� ���������ط����߼ƻ����������нű��п����Ҳ���·��
cd %~dp0%\..

echo load env.cmd ...
call config\env.cmd

::start program
echo java  %JAVA_OPTS% -jar lib\%jarName% %PROGRAM_CONFIG%
java  %JAVA_OPTS% -jar lib\%jarName% %PROGRAM_CONFIG%
@pause


