@echo off

cd "c:\Program Files\Kaspersky Lab"
If %errorlevel%==1 (
	cd "C:\Program Files (x86)\Kaspersky Lab\"
	)

dir /b > C:\zabbix\scripts\Kaspersky\kavpath.txt
set /p KavPath=< C:\zabbix\scripts\Kaspersky\kavpath.txt
cd %KavPath%

avp.com status > C:\zabbix\scripts\Kaspersky\KasperskyStatus.txt
avp.com report /R:C:\zabbix\scripts\Kaspersky\KasperskyReport.txt

EXIT /B