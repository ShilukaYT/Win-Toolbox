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

::Set color
:: NORMAL FOREG COLORS
set nhcolorsetcolor=
set Black=%nhcolorsetcolor%[30m
set Red=%nhcolorsetcolor%[31m
set Green=%nhcolorsetcolor%[32m
set Yellow=%nhcolorsetcolor%[33m
set Blue=%nhcolorsetcolor%[33m
set Magenta=%nhcolorsetcolor%[35m
set Cyan=%nhcolorsetcolor%[36m
set White=%nhcolorsetcolor%[37m
set Lightgray=%nhcolorsetcolor%[37m
:: STRONG FOREG COLORS
set SWhite=%nhcolorsetcolor%[90m
set SRed=%nhcolorsetcolor%[91m
set SGreen=%nhcolorsetcolor%[92m
set SYellow=%nhcolorsetcolor%[93m
set SBlue=%nhcolorsetcolor%[94m
set SMagenta=%nhcolorsetcolor%[95m
set SCyan=%nhcolorsetcolor%[96m
set SWhite=%nhcolorsetcolor%[97m
:: NORMALBACKGROUND
set NBlack=%nhcolorsetcolor%[40m
set NRed=%nhcolorsetcolor%[41m
set NGreen=%nhcolorsetcolor%[42m
set NYellow=%nhcolorsetcolor%[43m
set NBlue=%nhcolorsetcolor%[44m
set NMagenta=%nhcolorsetcolor%[45m
set NCyan=%nhcolorsetcolor%[46m
set NWhite=%nhcolorsetcolor%[47m
:: STRONGBACKGROUND
set BBlack=%nhcolorsetcolor%[100m
set BRed=%nhcolorsetcolor%[101m
set BGreen=%nhcolorsetcolor%[102m
set BYellow=%nhcolorsetcolor%[103m
set BBlue=%nhcolorsetcolor%[104m
set BMagenta=%nhcolorsetcolor%[105m
set BCyan=%nhcolorsetcolor%[106m
set BWhite=%nhcolorsetcolor%[107m
:: STYLE
set Green=%nhcolorsetcolor%[32m
set White=%nhcolorsetcolor%[37m
set Cyan=%nhcolorsetcolor%[36m
set Magenta=%nhcolorsetcolor%[35m
set Red=%nhcolorsetcolor%[31m
set Yellow=%nhcolorsetcolor%[33m
set Lightgray=%nhcolorsetcolor%[37m
set Bold=%nhcolorsetcolor%[1m

set nhcolor=%Bin%\nhcolor.exe
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
%nhcolor% 07 "  %Red%Hello %USERNAME% %White%| %Yellow%Computer Name: %COMPUTERNAME%"
%nhcolor% 07 "  %Green%Current OS: Windows %winver% %Edition% %White%| %Cyan%Build: %build% (%Ver%)"
echo.
echo ===============================================================================================
echo                                    Application Installer
%nhcolor% 07 " %Green%- Internet Browser                 - Game Client               - Android Games"
%nhcolor% 07 " %Yellow%+ [1] Google Chrome                %Blue%+ [11] Steam                %Magenta%+ [23] Google Play Games"
%nhcolor% 07 " %Yellow%+ [2] Microsoft Edge + webview2    %Blue%+ [12] Epic Games           %Magenta%+ [24] Free Fire MAX"
%nhcolor% 07 " %Yellow%+ [3] Mozilla Firefox              %Blue%+ [13] Xbox                 %Magenta%+ [25] Clash of Clans"
%nhcolor% 07 " %SWhite%- Zip and Unzip                    %Blue%+ [14] HoyoPlay             %SBlue%- System components"
%nhcolor% 07 " + [4] WinRAR (Activated)           - Software Development      + [26] Visual C++ 2005 - 2022"
%nhcolor% 07 " - Multimedia                       + [15] Visual Studio Code   + [27] DirectX
%nhcolor% 07 " + [5] VLC Media player             + [16] Visual Studio        + [28] Windows App SDK
%nhcolor% 07 " + [6] Windows Meida Player (UWP)   + [17] Github Desktop       - Virtual Machine
%nhcolor% 07 " + [7] Microsoft Photos             + [18] Python               + [29] VMware Workstation Pro
%nhcolor% 07 " - Office                           + [19] Sublime Text         + [30] Oracle VM VirtualBox
%nhcolor% 07 " + [8] Microsoft Office             - Android Emulator          - Recording and Live Streaming
%nhcolor% 07 " + [9] WPS Office                   + [20] BlueStacks           + [31] OBS Studio
%nhcolor% 07 " - App Store                        + [21] LDPlayer             + [32] Streamlab OBS
%nhcolor% 07 " + [10] Microsoft Store             + [22] MSI App Player       + [33] TikTok Live Studio
echo %line%
%nhcolor% 07 " [Z] Subscribe to Hieu GL Lite                                         Page 1 - [N] Next Page"
%nhcolor% 07 " [X] Quit"
echo %line%
set /p MainChoice=" %SWhite%Enter Your Choice and ENTER: "