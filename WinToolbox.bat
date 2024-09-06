@echo off
setlocal EnableDelayedExpansion EnableExtensions
mode 95,30

set "AppName=Windows Toolbox (Developer Test)"
set "ver=1.0"
set "vercode=1"

goto :Basic

::Function
:GetOSInfo
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul') do set "build1=%%b"
if "%build1%" GEQ "22000" (
    set winver=11
)
if "%build1%" LSS "22000" (
    set winver=10
)
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 2^>nul') do set "editionid=%%b"
if "%editionid%"=="CoreSingleLanguage" (
    set "Edition=Home Single Language"
)
if "%editionid%"=="Professional" (
    set "Edition=Pro"
)
if "%editionid%"=="Core" (
    set "Edition=Home"
)
if "%editionid%"=="Enterprise" (
    set "Edition=Enterprise"
)
if "%editionid%"=="IoTEnterprise" (
    set "Edition=IoT Enterprise"
)
if "%editionid%"=="IoTEnterpriseS" (
    set "Edition=IoT Enterprise LTSC"
)
for /f "tokens=6-7 delims=[.] " %%i in ('ver') do set build=%%i.%%j
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "DisplayVersion" 2^>nul') do set "Ver=%%b"

goto :EOF

:Basic
title %AppName%
cd /d %~dp0

set Bin=%~dp0Bin
set Temp=%~dp0Temp
set Download=%~dp0Download

set wget=%Bin%\wget.exe
set aria2c=%Bin%\aria2c.exe
set SevenZip=%Bin%\7za.exe
set DisableX=%Bin%\ConsoleNoClose.exe

set "Line================================================================================================"

goto :main

:CreUI
:: Create UI
echo %Line%
echo                                      Windows Toolbox
echo                                    Made by Hieu GL Lite
echo %line%
echo.
goto :EOF

:Main
call :GetOSInfo
call :CreUI
Echo   Hello %USERNAME%, Computer Name: %COMPUTERNAME%
echo   Current OS: Windows %winver% %Edition%, Build: %build% (%Ver%)
echo.
echo %Line%
echo.
echo   
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %line%
echo [Z] Subscribe to Hieu GL Lite
echo [X] Quit
echo %line%
pause