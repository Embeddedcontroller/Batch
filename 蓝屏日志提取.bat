rem 请在出现问题的电脑上打开该文件！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！
rem 请在出现问题的电脑上打开该文件！！！！！！


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
if not exist %windir%\Minidump\*.dmp goto nofile
echo =============================================================================
echo 			存在蓝屏日志
echo =============================================================================
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (
set desk=%%j
)
cd /d %desk%
md 蓝屏日志文件！！
copy %windir%\Minidump\*.dmp %desk%\蓝屏日志文件！！
echo =============================================================================
echo 			已在桌面创建蓝屏日志文件夹
echo 			请把桌面的“蓝屏日志文件！！”压缩后发送到694178258@qq.com。
echo =============================================================================
start mailto:694178258@qq.com?subject=蓝屏日志
pause
exit
:nofile
echo =============================================================================
echo 			未发现蓝屏文件
echo 			蓝屏后请等待电脑自动重启
echo =============================================================================
pause
