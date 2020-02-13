@echo off

Start /wait C:\zabbix\scripts\WinSmartInfo\smartmontools-6.6-1.win32-setup.exe /S

rem Скрипт за пускается на Windows XP?
ver | find "5.1."

If %errorlevel%==0  (
	rem Windows XP
	SCHTASKS /Create /RU "NT AUTHORITY\SYSTEM" /SC HOURLY /ST 09:00:00 /TN "WinSmartInfo" /TR "\"C:\zabbix\scripts\WinSmartInfo\WinSmartInfo.bat\""
 ) else (
	rem НЕ Windows XP
	SCHTASKS /Create /RU "NT AUTHORITY\SYSTEM" /SC DAILY /ST 09:00 /RI 60 /DU 12:00 /TN "WinSmartInfo" /TR "\"C:\zabbix\scripts\WinSmartInfo\WinSmartInfo.bat\"" /RL HIGHEST /F
 )

CALL C:\zabbix\scripts\WinSmartInfo\WinSmartInfo.bat

EXIT /B
