rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！
rem 请用出现问题的电脑打开该文件！

::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO 管理员模式启动中，请在弹出的窗口栏里选择“是”
 ECHO 部分杀毒软件会阻拦（比如360），请选择“允许”
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
  ECHO 提升管理员权限中...
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
 ECHO 管理员模式启动中，请在弹出的窗口栏里选择“是”
 ECHO 部分杀毒软件会阻拦（比如360），请选择“允许”
 ECHO 本文件仅关闭win10内核隔离，解决部分TP弹窗问题
 ECHO =============================

@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_dword /d 00000000 /f >nul 2>nul
Echo wscript.Echo MsgBox ("操作已完成。需要重启电脑后才能生效，是否重启电脑？", 36, "提示")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
@echo =============================================
@echo 操作已完成，请重启电脑后再打开助手进行操作
@echo =============================================
@echo 一定要重启电脑！否则依然有提示
@echo =============================================
@echo 如还有问题请联系版主或蠢灰
@echo =============================================
@echo. & pause