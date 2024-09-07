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
%nhcolor% 07 %Line%
%nhcolor% 07 "                                      %SWhite%Windows Toolbox
echo                                    Made by %SBlue%Hieu GL Lite
%nhcolor% 07 %line%
echo.
goto :EOF

:Main
call :GetOSInfo
call :CreUI
%nhcolor% 07 "  %Red%Hello %USERNAME% %White%| %Yellow%Computer Name: %COMPUTERNAME%"
%nhcolor% 07 "  %Green%Current OS: Windows %winver% %Edition% %White%| %Cyan%Build: %build% (%Ver%)"
echo.
%nhcolor% 07 ===============================================================================================
echo                                    Application Installer
%nhcolor% 07 " %Green%- Internet Browser                 - Game Client               - Android Games"
%nhcolor% 07 " %Yellow%+ [1] Google Chrome                %Blue%+ [11] Steam                %Magenta%+ [23] Google Play Games"
%nhcolor% 07 " %Yellow%+ [2] Microsoft Edge + Webview2    %Blue%+ [12] Epic Games           %Magenta%+ [24] Free Fire MAX"
%nhcolor% 07 " %Yellow%+ [3] Mozilla Firefox              %Blue%+ [13] Xbox                 %Magenta%+ [25] Clash of Clans"
%nhcolor% 07 " %SWhite%- Zip and Unzip                    %Blue%+ [14] HoyoPlay             %SBlue%- System components"
%nhcolor% 07 " %SRed%+ [4] WinRAR (Activated)           %SCyan%- Software Development      %Lightgray%+ [26] Visual C++ 2005 - 2022"
%nhcolor% 07 " %SMagenta%- Multimedia                       %SMagenta%+ [15] Visual Studio Code   %Lightgray%+ [27] DirectX
%nhcolor% 07 " %SBlue%+ [5] VLC Media player             %SMagenta%+ [16] Visual Studio        %Lightgray%+ [28] Windows App SDK
%nhcolor% 07 " %SBlue%+ [6] Windows Meida Player (UWP)   %SMagenta%+ [17] Github Desktop       %SWhite%- Virtual Machine
%nhcolor% 07 " %SBlue%+ [7] Microsoft Photos             %SMagenta%+ [18] Python               %SYellow%+ [29] VMware Workstation Pro
%nhcolor% 07 " %SLightGray%- Office                           %SMagenta%+ [19] Sublime Text         %SYellow%+ [30] Oracle VM VirtualBox
%nhcolor% 07 " %SLightGray%+ [8] Microsoft Office             %Bold%- Android Emulator          %Blue%- Recording and Live Streaming
%nhcolor% 07 " %SLightGray%+ [9] WPS Office                   %SRed%+ [20] BlueStacks           %Green%+ [31] OBS Studio
%nhcolor% 07 " %SGreen%- App Store                        %SRed%+ [21] LDPlayer             %Green%+ [32] Streamlab OBS
%nhcolor% 07 " + [10] Microsoft Store             %SRed%+ [22] MSI App Player       %Green%+ [33] TikTok Live Studio
%nhcolor% 07 %line%
%nhcolor% 07 " [Z] Subscribe to Hieu GL Lite                                         Page 1"
%nhcolor% 07 " [X] Quit"
%nhcolor% 07 %line%
set /p MainChoice=" %SWhite%Enter Your Choice and ENTER: "
if "%MainChoice%"=="1" goto :Chrome
if "%MainChoice%"=="2"
if "%MainChoice%"=="3"
if "%MainChoice%"=="4"
if "%MainChoice%"=="5"
if "%MainChoice%"=="6"
if "%MainChoice%"=="7"
if "%MainChoice%"=="8"
if "%MainChoice%"=="9"
if "%MainChoice%"=="10"
if "%MainChoice%"=="11"
if "%MainChoice%"=="12"
if "%MainChoice%"=="13"
if "%MainChoice%"=="14"
if "%MainChoice%"=="15"
if "%MainChoice%"=="16"
if "%MainChoice%"=="17"
if "%MainChoice%"=="18"
if "%MainChoice%"=="19"
if "%MainChoice%"=="20"
if "%MainChoice%"=="21"
if "%MainChoice%"=="22"
if "%MainChoice%"=="23"
if "%MainChoice%"=="24"
if "%MainChoice%"=="25"
if "%MainChoice%"=="26"
if "%MainChoice%"=="27"
if "%MainChoice%"=="28"
if "%MainChoice%"=="29"
if "%MainChoice%"=="30"
if "%MainChoice%"=="31"
if "%MainChoice%"=="32"
if "%MainChoice%"=="33"
if "%MainChoice%"=="z"
if "%MainChoice%"=="Z"
if "%MainChoice%"=="x"
if "%MainChoice%"=="X"

:Chrome
cls
call :CreUI
%nhcolor% 07 " Do you want to install Google Chrome?"
%nhcolor% 07 " [1] YES (>700MB)              [2] NO"
set /p ChromeChoice=" %SWhite%Enter Your Choice and ENTER: "
if