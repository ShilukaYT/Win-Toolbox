@echo off
setlocal EnableDelayedExpansion EnableExtensions
mode 95,30

set "AppName=Windows Toolbox (Developer Test)"
set "ver=1.0"
set "vercode=1"

goto :Basic
::========================================================================================================================================================

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
::========================================================================================================================================================

:Basic
title %AppName%
cd /d %~dp0

set Bin=%~dp0Bin
set Temp=%~dp0Temp
set Download=%~dp0Downloads

if not exist %Temp% mkdir %Temp%
::========================================================================================================================================================

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
::========================================================================================================================================================

set nhcolor=%Bin%\nhcolor.exe
set wget=%Bin%\wget.exe
set aria2c=%Bin%\aria2c.exe
set SevenZip=%Bin%\7za.exe
set DisableX=%Bin%\ConsoleNoClose.exe

set "Line================================================================================================"

goto :Main
::========================================================================================================================================================

:CreUI
:: Create UI
%nhcolor% 07 %Line%
%nhcolor% 07 "                                      %SWhite%Windows Toolbox
echo                                    Made by %SBlue%Hieu GL Lite
%nhcolor% 07 %line%
echo.
goto :EOF
::========================================================================================================================================================

:Main
cls
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
%nhcolor% 07 " %Yellow%+ [3] Mozilla Firefox              %Blue%+ [13] Riot Client          %Magenta%+ [25] Clash of Clans"
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
%nhcolor% 07 " + [10] Microsoft Store and Xbox    %SRed%+ [22] MSI App Player       %Green%+ [33] TikTok Live Studio
%nhcolor% 07 %line%
%nhcolor% 07 " [Z] Subscribe to Hieu GL Lite                                         Page 1"
%nhcolor% 07 " [X] Quit"
%nhcolor% 07 %line%
set /p MainChoice=" %SWhite%Enter Your Choice and ENTER: "
if "%MainChoice%"=="1" (
    set "url=https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
    set "BrowserName=Google Chrome"
    set size=700MB
    set filename=googlechromestandaloneenterprise64.msi
    goto :Browsers
)
if "%MainChoice%"=="2" (
    set "url=https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=en&brand=M100"
    set "BrowserName=Microsoft Edge + Webview2"
    set size=2GB
    set filename=MicrosoftEdgeSetup.exe
    goto :Browsers
)
if "%MainChoice%"=="3" (
    set "url=https://github.com/ShilukaYT/Win-Toolbox/raw/main/RawCloud/FirefoxInstaller.exe"
    set "BrowserName=Mozilla Firefox"
    set size=300MB
    set "filename=FirefoxInstaller.exe"
    goto :Browsers
)
if "%MainChoice%"=="4" goto :WinRAR
if "%MainChoice%"=="5" goto :VLC
if "%MainChoice%"=="6" (
    set id=9wzdncrfj3pt
    set "AppName=Windows Media Player (UWP)"
    set size=51MB
    set filename=Media_Player.exe
    goto :MSStoreApp
)
if "%MainChoice%"=="7" (
    set id=9wzdncrfjbh4
    set "AppName=Microsoft Photos"
    set size=810MB
    set filename=Microsoft_Photos.exe
    goto :MSStoreApp
)
if "%MainChoice%"=="8" goto :Office
if "%MainChoice%"=="9" goto :WPSOffice
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
echo.
echo This function not available yet
timeout /t 2 >nul
goto :Main
::========================================================================================================================================================

:Browsers
cls
call :CreUI
%nhcolor% 07 " Do you want to install %BrowserName%?"
%nhcolor% 07 " [1] YES (>%size%)              [2] NO"
set /p BrowserChoice="Enter Your Choice and ENTER: "
if "!BrowserChoice!"=="1" goto :BrowserInstall
if "!BrowserChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :Browsers
:BrowserInstall
echo.
%nhcolor% 07 "Downloading %BrowserName%..."
%wget% --output-document="%filename%" -q --show-progress "%url%"
move %filename% %Temp%\%filename% >nul
%nhcolor% 07 "Installing %BrowserName%..."
%Temp%\%filename%
%nhcolor% 07 "Done"
del /s /q %Temp%\%filename% >nul
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================

:WinRAR
cls
call :CreUI
%nhcolor% 07 " Do you want to install WinRAR?"
%nhcolor% 07 " [1] YES (10MB)              [2] NO"
set /p AppChoice="Enter Your Choice and ENTER: "
if "!AppChoice!"=="1" goto :WinRARInstall
if "!AppChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :WinRAR
:WinRARInstall
echo.
%nhcolor% 07 "Downloading WinRAR..."
%wget% --output-document="winrar-x64-701.exe" -q --show-progress "https://www.rarlab.com/rar/winrar-x64-701.exe"
%wget% --output-document="rarreg.key" -q --show-progress "https://github.com/ShilukaYT/Win-Toolbox/raw/main/RawCloud/rarreg.key"
move winrar-x64-701.exe %Temp%\winrar-x64-701.exe >nul
%nhcolor% 07 "Installing WinRAR..."
%Temp%\winrar-x64-701.exe /S
move rarreg.key "%ProgramFiles%\WinRAR\rarreg.key">nul
%nhcolor% 07 "Done"
del /s /q winrar-x64-701.exe >nul
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================

:VLC
cls
call :CreUI
%nhcolor% 07 " Do you want to install VLC Media Player?"
%nhcolor% 07 " [1] YES (179MB)              [2] NO"
set /p AppChoice="Enter Your Choice and ENTER: "
if "!AppChoice!"=="1" goto :VLCInstall
if "!AppChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :VLC
:VLCInstall
echo.
%nhcolor% 07 "Downloading VLC Media Player..."
%wget% --output-document="vlc-3.0.21-win64.exe" -q --show-progress "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
move vlc-3.0.21-win64.exe %Temp%\vlc-3.0.21-win64.exe >nul
%nhcolor% 07 "Installing VLC Media Player..."
%Temp%\vlc-3.0.21-win64.exe /S
%nhcolor% 07 "Done"
del /s /q %Temp%\vlc-3.0.21-win64.exe
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================
:MSStoreApp
cls
call :CreUI
%nhcolor% 07 " Do you want to install %AppName%?"
%nhcolor% 07 " [1] YES (%size%)              [2] NO"
set /p AppChoice="Enter Your Choice and ENTER: "
if "!AppChoice!"=="1" goto :MSStoreAppInstall
if "!AppChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :MSStoreApp
:MSStoreAppInstall
%nhcolor% 07 "Downloading %AppName%..."
%wget% --output-document="%filename%" -q --show-progress "https://get.microsoft.com/installer/download/!id!?hl=en-us&referrer=storeforweb&source"
move %filename% %Temp%\%filename% >nul
%nhcolor% 07 "Installing %AppName%..."
%Temp%\%filename% 2>nul >nul
%nhcolor% 07 "Done"
del /s /q %Temp%\%filename% >nul
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================

:Office
cls
call :CreUI
%nhcolor% 07 " Do you want to install Microsoft Office (Microsoft 365)?"
%nhcolor% 07 " [1] YES (4GB)              [2] NO"
set /p AppChoice="Enter Your Choice and ENTER: "
if "!AppChoice!"=="1" goto :OfficeInstall
if "!AppChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :Office
:OfficeInstall
%nhcolor% 07 "Downloading Microsoft Office (Microsoft 365)..."
%wget% --output-document="setup.exe" -q --show-progress "https://github.com/ShilukaYT/Win-Toolbox/raw/main/RawCloud/setup.exe"
%wget% --output-document="OfficeConfiguration.xml" -q --show-progress "https://github.com/ShilukaYT/Win-Toolbox/raw/main/RawCloud/OfficeConfiguration.xml"
move setup.exe %Temp%\setup.exe >nul
move setup.exe %Temp%\OfficeConfiguration.xml >nul
%nhcolor% 07 "Installing Microsoft Office (Microsoft 365)..."
%Temp%\setup.exe /configure %Temp%\OfficeConfiguration.xml
%nhcolor% 07 "Done"
del /s /q %Temp%\setup.exe >nul
del /s /q %Temp%\OfficeConfiguration.xml >nul
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================

:WPSOffice
cls
call :CreUI
%nhcolor% 07 " Do you want to install WPS Office?"
%nhcolor% 07 " [1] YES (1GB)              [2] NO"
set /p AppChoice="Enter Your Choice and ENTER: "
if "!AppChoice!"=="1" goto :WPSOfficeInstall
if "!AppChoice!"=="2" (
    goto :Main
)
echo.
echo This function not available yet
timeout /t 2 >nul
goto :WPSOffice
:WPSOfficeInstall
%nhcolor% 07 "Downloading WPS Office..."
%wget% --output-document="WPSOffice_12.2.0.18283.exe" -q --show-progress "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/12.2.0.18283/500.1001/WPSOffice_12.2.0.18283.exe"
move WPSOffice_12.2.0.18283.exe %Temp%\WPSOffice_12.2.0.18283.exe >nul
%nhcolor% 07 "Installing Microsoft Office (Microsoft 365)..."
%Temp%\WPSOffice_12.2.0.18283.exe -S
%nhcolor% 07 "Done"
del /s /q %Temp%\WPSOffice_12.2.0.18283.exe >nul
timeout /t 5 /nobreak>nul
goto :Main
::========================================================================================================================================================

