@echo off
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
net session >NUL 2>NUL
if '%errorlevel%' EQU '0' (	
	echo ===================================================================
	echo 	使用管理员身份运行 √
	echo ===================================================================
) else (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' EQU '0' (	
	echo ===================================================================
    echo 	使用管理员身份运行 √
	echo ===================================================================
) else (
	echo ===================================================================
    echo 	该安装程序未使用管理员模式运行
	echo 	请对该文件右键选择“管理员模式运行”
	echo ===================================================================
	pause
	exit
)
)
@echo 正在重置网络设置中...
REM 重置网络设置
@taskkill  /f /t /im  IEXPLORE.exe >nul 2>nul
@netsh winsock reset all >nul 2>nul
@netsh int ipv4 reset all >nul 2>nul
@netsh int portproxy reset all >nul 2>nul
@netsh int tcp reset all >nul 2>nul
@netsh int teredo reset all >nul 2>nul
@echo 清理IE设置代理中..
rem 禁用自动检测设置
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
rem 禁用代理
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>nul
rem 删除代理IP地址
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>nul
rem 禁用自动配制脚本（地址也被删除）
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /f >nul 2>nul
@echo 清理ie缓存中..
rem 清理ie缓存
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
@for /f "tokens=4*" %%a in ('netsh interface show interface ^| findstr "已连接"') do set "ConName=%%~a"
netsh interface ip set dns %ConName% static 119.29.29.29
if '%errorlevel%' EQU '0' (	
echo 修改网卡DNS成功
) else (
echo 修改网卡DNS失败
)
REM 修改当前网卡dns
ipconfig /flushdns
@echo 127.0.0.1 localhost>%systemroot%\system32\drivers\etc\hosts 
REM HOSTS清空
@echo 正在同步本地时间...请稍候..
@sc config W32Time start= auto >nul 2>nul
REM 时间服务选择自动启动
@w32tm /register >nul 2>nul
REM 注册时间服务
@net start W32Time >nul 2>nul
REM 启动时间服务
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxNegPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxPosPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
REM 修改注册表值，修改 修改时间 的最大和最小间隔
@w32tm /config /manualpeerlist:"ntp1.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM 联网修改时间
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
@w32tm /config /manualpeerlist:"ntp2.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM 联网修改时间
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
REM 重启电脑提示
Echo wscript.Echo MsgBox ("操作已完成。需要重启电脑后才能生效，是否重启电脑", 36, "提示")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
@echo ————————————————————————————————————————
@echo ————————————————————————————————————————
@echo 已经初始化设置，需要重启电脑后再重试腾讯手游助手。
@echo 还有问题联系版主or群管理。
@echo ————————————————————————————————————————
@echo ————————————————————————————————————————
@echo. & pause