@echo off
rem ���ڳ�������ĵ����ϴ򿪸��ļ�����������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
rem ���ڳ�������ĵ����ϴ򿪸��ļ�������������
net session >NUL 2>NUL
if '%errorlevel%' EQU '0' (	
	echo ===================================================================
	echo 	ʹ�ù���Ա������� ��
	echo ===================================================================
) else (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' EQU '0' (	
	echo ===================================================================
    echo 	ʹ�ù���Ա������� ��
	echo ===================================================================
) else (
	echo ===================================================================
    echo 	�ð�װ����δʹ�ù���Աģʽ����
	echo 	��Ը��ļ��Ҽ�ѡ�񡰹���Աģʽ���С�
	echo ===================================================================
	pause
	exit
)
)
@echo ������������������...
REM ������������
@taskkill  /f /t /im  IEXPLORE.exe >nul 2>nul
@netsh winsock reset all >nul 2>nul
@netsh int ipv4 reset all >nul 2>nul
@netsh int portproxy reset all >nul 2>nul
@netsh int tcp reset all >nul 2>nul
@netsh int teredo reset all >nul 2>nul
@echo ����IE���ô�����..
rem �����Զ��������
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
rem ���ô���
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>nul
rem ɾ������IP��ַ
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>nul
rem �����Զ����ƽű�����ַҲ��ɾ����
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /f >nul 2>nul
@echo ����ie������..
rem ����ie����
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
@for /f "tokens=4*" %%a in ('netsh interface show interface ^| findstr "������"') do set "ConName=%%~a"
netsh interface ip set dns %ConName% static 119.29.29.29
if '%errorlevel%' EQU '0' (	
echo �޸�����DNS�ɹ�
) else (
echo �޸�����DNSʧ��
)
REM �޸ĵ�ǰ����dns
ipconfig /flushdns
@echo 127.0.0.1 localhost>%systemroot%\system32\drivers\etc\hosts 
REM HOSTS���
@echo ����ͬ������ʱ��...���Ժ�..
@sc config W32Time start= auto >nul 2>nul
REM ʱ�����ѡ���Զ�����
@w32tm /register >nul 2>nul
REM ע��ʱ�����
@net start W32Time >nul 2>nul
REM ����ʱ�����
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxNegPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxPosPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
REM �޸�ע���ֵ���޸� �޸�ʱ�� ��������С���
@w32tm /config /manualpeerlist:"ntp1.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM �����޸�ʱ��
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
@w32tm /config /manualpeerlist:"ntp2.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM �����޸�ʱ��
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
REM ����������ʾ
Echo wscript.Echo MsgBox ("��������ɡ���Ҫ�������Ժ������Ч���Ƿ���������", 36, "��ʾ")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
@echo ��������������������������������������������������������������������������������
@echo ��������������������������������������������������������������������������������
@echo �Ѿ���ʼ�����ã���Ҫ�������Ժ���������Ѷ�������֡�
@echo ����������ϵ����orȺ����
@echo ��������������������������������������������������������������������������������
@echo ��������������������������������������������������������������������������������
@echo. & pause