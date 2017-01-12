@echo off
Color a
Title BakchodConnectify by Ankur, Abhish3k

mode con:cols=55 lines=2
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    

:main
mode con:cols=120 lines=28
cls
echo ********************************************************************
echo *                                                                  *
echo *                                                                  *
echo ********************************************************************
echo   1. If this is your first time then give input '1'. 
echo   2. If You Have already created a profile and want to start the hotspot then give input '2'.
echo   3. If You want to re-configure the existing profile then input '3'.
echo   4. If you forgot to turn off the wifi before exiting last time and wanna turn off it then input'4'.
echo   5. Exit
set /p input = Write the option number here :
IF %input% EQU 1 GOTO firststart
IF %input% EQU 2 GOTO start
IF %input% EQU 3 GOTO configure
IF %input% EQU 4 GOTO bye
IF %input% EQU 5 exit

:start
netsh wlan start hostednetwork
GOTO main

:configure
set /p n=ssid:
set /p m=Password:
netsh wlan set hostednetwork mode=allow ssid=%n% key=%m%
netsh wlan start hostednetwork
GOTO main

:bye
netsh wlan stop hostednetwork
GOTO main

:firststart
echo --------------------------------
echo Input 1-For turning off the hotspot              2-For Restarting the hotspot 
echo 3-For reconfigure the hotspot                 4-exit  

set /p O=Input:
IF %O% EQU 1 netsh wlan stop hostednetwork
IF %O% EQU 2 netsh wlan start hostednetwork
IF %O% EQU 3 GOTO configure
IF %O% EQU 4 exit
GOTO main