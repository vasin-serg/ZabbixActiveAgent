@echo off

rem Скрипт за пускается на Windows XP?
ver | find "5.1."

If %errorlevel%==0  (
	rem Windows XP
	wmic /namespace:\\root\SecurityCenter  path AntiVirusProduct get /value > C:\zabbix\scripts\AV_Common_Status\AV_Common_Status.tmp
 ) else (
	rem НЕ Windows XP
 	wmic /namespace:\\root\SecurityCenter2 path AntiVirusProduct get /value > C:\zabbix\scripts\AV_Common_Status\AV_Common_Status.tmp
 )

rem Немного магии. Уберём из файла непечатные спецсимволы
type C:\zabbix\scripts\AV_Common_Status\AV_Common_Status.tmp > C:\zabbix\scripts\AV_Common_Status\AV_Common_Status.txt

EXIT /B
