rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���
rem ���ó�������ĵ��Դ򿪸��ļ���

::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO ����Աģʽ�����У����ڵ����Ĵ�������ѡ���ǡ�
 ECHO ����ɱ�����������������360������ѡ������
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO ��������ԱȨ����...
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
 REM Run shell as admin (example) - put here code as you like
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO ����Աģʽ�����У����ڵ����Ĵ�������ѡ���ǡ�
 ECHO ����ɱ�����������������360������ѡ������
 ECHO ���ļ����ر�win10�ں˸��룬�������TP��������
 ECHO =============================

@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_dword /d 00000000 /f >nul 2>nul
Echo wscript.Echo MsgBox ("��������ɡ���Ҫ�������Ժ������Ч���Ƿ��������ԣ�", 36, "��ʾ")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
@echo =============================================
@echo ��������ɣ����������Ժ��ٴ����ֽ��в���
@echo =============================================
@echo һ��Ҫ�������ԣ�������Ȼ����ʾ
@echo =============================================
@echo �绹����������ϵ���������
@echo =============================================
@echo. & pause