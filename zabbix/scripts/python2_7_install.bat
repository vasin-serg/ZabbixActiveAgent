@Rem �⪫�砥� �뢮� ᠬ�� ������ �� ��࠭
@echo off

Rem �।��������, �� �� Windows XP �ਯ� ����᪠���� ����������஬.
Rem ��� ����� ����� ��⥬ �� ����୮.

rem ����砥� ����� ��
ver | find "5.1."

rem Windows XP ?
If %errorlevel%==0  (
	rem �ய�᪠�� �஢��� �����᪨� �ࠢ
	GOTO SKIPADMIN
 )
 
SET HasAdminRights=0

FOR /F %%i IN ('WHOAMI /PRIV /NH') DO (
	IF "%%i"=="SeTakeOwnershipPrivilege" SET HasAdminRights=1
)

IF NOT %HasAdminRights%==1 (
	ECHO .
	ECHO ��� �ਯ� ����室��� ����᪠�� �� ����� �����������.
	ECHO .
	GOTO END
)

:SKIPADMIN

rem ��⠭�������� ⮫쪮 32-ࠧ�來� Python, �.�. �ਯ⠬ ����� ����� �� �㦭�.
start /wait msiexec.exe /passive /i "%~dp0python-2.7.17.msi" /norestart ALLUSERS=1 ADDLOCAL=ALL


rem ���樨�㥬 䠩�� .py � �������஬ Python � ����ࠨ���� PATH
setx PATH "C:\Python27\;C:\Python27\Scripts;%Path%"
assoc .py=Python.File
ftype Python.File=C:\Python27\python.exe "%1" %*

rem ��⠭�������� �������⥫�� ���㫨
C:\Python27\Scripts\pip.exe install pywin32
C:\Python27\Scripts\pip.exe install WMI

ECHO .
ECHO ���!
ECHO .
	
:END

PAUSE

EXIT /B