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
@echo --------------------------------
@echo BaiduProtect.exe检测中
@echo --------------------------------
@set set "var=" >nul 2>nul
@for /f "skip=1 delims=" %%a in ('wmic process where "name='BaiduProtect.exe'" get  ExecutablePath') do (
    if not defined var set "var=%%~dpa"
)
@set "var=%var:~,-1%" >nul 2>nul
:loop
@tasklist | find /i "BaiduProtect.exe" >nul 2>nul
@if errorlevel 1 (echo 未发现BaiduProtect.exe
) else (
echo =========================================
echo 检测到阻止助手运行相关组件
echo 请根据弹窗进行卸载！
echo 必须！！卸载！！
echo =========================================
start "" "%var%\uninst.exe"
for /l %%i in (5,-1,0) do (
cls
echo ============================================
echo 倒计时%%i后将再次检测是否有该程序
echo 如未卸载，将再次弹出卸载程序。
echo 请一定一定一定要卸载！
echo ============================================
ping 127.1 -n 2 >nul
)
goto loop
)
@sc delete bd0001
@sc delete bd0002
@sc delete bd0003
@sc delete bd0004
@sc delete BDArKit
@sc delete BDCEnhance
@sc delete bduniptk
@del %SystemRoot%\system32\drivers\bd0001.sys
@echo 123 > %SystemRoot%\system32\drivers\bd0001.txt
@rename %SystemRoot%\system32\drivers\bd0001.txt bd0001.sys
attrib +r %SystemRoot%\system32\drivers\bd0001.sys

@del %SystemRoot%\system32\drivers\bd0002.sys
@echo 123 > %SystemRoot%\system32\drivers\bd0002.txt
@rename %SystemRoot%\system32\drivers\bd0001.txt bd0002.sys
attrib +r %SystemRoot%\system32\drivers\bd0002.sys

@del %SystemRoot%\system32\drivers\bd0003.sys
@echo 123 > %SystemRoot%\system32\drivers\bd0003.txt
@rename %SystemRoot%\system32\drivers\bd0001.txt bd0003.sys
attrib +r %SystemRoot%\system32\drivers\bd0003.sys

@del %SystemRoot%\system32\drivers\bd0004.sys
@echo 123 > %SystemRoot%\system32\drivers\bd0004.txt
@rename %SystemRoot%\system32\drivers\bd0001.txt bd0004.sys
attrib +r %SystemRoot%\system32\drivers\bd0004.sys

@del %SystemRoot%\system32\drivers\BDArKit.sys
@echo 123 > %SystemRoot%\system32\drivers\BDArKit.txt
@rename %SystemRoot%\system32\drivers\BDArKit.txt BDArKit.sys
attrib +r %SystemRoot%\system32\drivers\BDArKit.sys

@del %SystemRoot%\system32\drivers\BDCEnhance.sys
@echo 123 > %SystemRoot%\system32\drivers\BDCEnhance.txt
@rename %SystemRoot%\system32\drivers\BDCEnhance.txt BDCEnhance.sys
attrib +r %SystemRoot%\system32\drivers\BDCEnhance.sys

@del %SystemRoot%\system32\drivers\bduniptk.sys
@echo 123 > %SystemRoot%\system32\drivers\bduniptk.txt
@rename %SystemRoot%\system32\drivers\bduniptk.txt bduniptk.sys
attrib +r %SystemRoot%\system32\drivers\bduniptk.sys



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