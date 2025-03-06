@echo off
title Windows Tweaks Menu by @Saad1430
:menu
cls
echo =======================================
echo        Windows Tweaks Menu
echo =======================================
echo [1] Enable Classic Context Menu
echo [2] Enable Windows Photo Viewer
echo [3] Restart Windows Explorer
echo [4] Move Taskbar Icons (Left/Center)
echo [5] Modify Search Bar (Icon Only)
echo [6] Remove Task View from Taskbar
echo [7] Install Software
echo [8] Change Wallpaper to Solid Black
echo [9] Change Timezone to Asia/Karachi
echo [10] Uninstall Edge
echo [11] Install Games Server (SteamCMD)
echo =======================================
echo [x] Exit
echo =======================================
set /p choice="Enter your choice (1-11): "

if "%choice%"=="1" goto context_menu
if "%choice%"=="2" goto photo_viewer
if "%choice%"=="3" goto restart_explorer
if "%choice%"=="4" goto move_taskbar
if "%choice%"=="5" goto modify_search
if "%choice%"=="6" goto remove_task_view
if "%choice%"=="7" goto install_software
if "%choice%"=="8" goto change_wallpaper
if "%choice%"=="9" goto change_timezone
if "%choice%"=="10" goto uninstall_edge
if "%choice%"=="11" goto install_games
if "%choice%"=="x" exit

echo Invalid choice! Please enter a valid option.
pause
goto menu

:context_menu
echo Enabling Classic Context Menu...
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /f /im explorer.exe
start explorer.exe
echo Done! Press any key to return to the menu...
pause
goto menu

:photo_viewer
echo Enabling Windows Photo Viewer...
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .jpg /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .jpeg /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .png /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .bmp /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .gif /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .tif /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .tiff /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
echo Done! Press any key to return to the menu...
pause
goto menu

:restart_explorer
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Done! Press any key to return to the menu...
pause
goto menu

:move_taskbar
echo [1] Move Taskbar Icons to Left
echo [2] Move Taskbar Icons to Center
set /p tbchoice="Enter your choice (1-2): "
if "%tbchoice%"=="1" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f
if "%tbchoice%"=="2" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe
pause
goto menu

:modify_search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe
pause
goto menu

:remove_task_view
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe
start explorer.exe
pause
goto menu

:change_wallpaper
echo Creating black wallpaper...
powershell -Command "$img = [System.IO.File]::WriteAllBytes('C:\\blackwallpaper.bmp', [byte[]](0x42, 0x4D, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\\blackwallpaper.bmp" /f
rundll32.exe user32.dll,UpdatePerUserSystemParameters
echo Done! Press any key to return to the menu...
pause
goto menu

:change_timezone
echo Changing timezone to Asia/Karachi...
tzutil /s "Pakistan Standard Time"
echo Done! Press any key to return to the menu...
pause
goto menu

:uninstall_edge
echo Uninstalling Edge Browser (finally)...
winget uninstall microsoft.edge
echo Done! Press any key to return to the menu...
pause
goto menu

:install_software
cls
echo =======================================
echo        Software Installation Menu
echo =======================================
echo [1] Brave Browser                [2] Mozilla Firefox
echo [3] Ditto Clipboard Manager      [4] Internet Download Manager
echo [5] Google Chrome                [6] Google Drive
echo [7] ShareX                       [8] SteamCMD + DirectX
echo [9] XAMPP + PHP in PATH          [10] VS Code
echo [11] Python (3.11)               [12] Node.js LTS
echo [13] Android Studio              [14] Notepad++
echo [15] Discord                     [16] WinRAR
echo [17] 7-Zip                       [18] MPC-HC
echo [19] qBittorrent                 [20] Everything Search
echo [21] Steam                       [22] Jellyfin Server
echo [23] FileZilla Server            [24] FileZilla Client
echo [25] Git                         [26] LM Studio
echo [27] MySQL                       [28] PhpStorm
echo [29] TOR Browser                 [30] MS Office 365
echo [31] PowerToys                   [32] MegaCMD
echo [33] Composer                    [34] Proton Pass
echo [35] Postman                     [36] Visual Studio 2022 Community
echo [37] MS SQLServer 2022           [38] 
echo =======================================
echo [0] Exit to Main Menu            [x] Exit
echo =======================================
set /p software_choice="Enter the number of the software you want to install (0-36): "

if "%software_choice%"=="1" winget install --id=Brave.Brave -i
if "%software_choice%"=="2" winget install --id=Mozilla.Firefox -i
if "%software_choice%"=="3" winget install --id=Ditto.Ditto --silent
if "%software_choice%"=="4" winget install --id=Tonec.InternetDownloadManager -i
if "%software_choice%"=="5" winget install --id=Google.Chrome -i
if "%software_choice%"=="6" winget install --id=Google.Drive -i
if "%software_choice%"=="7" winget install --id=ShareX.ShareX -i
if "%software_choice%"=="8" (
    mkdir "D:\Server"
    winget install --id=Valve.SteamCMD --silent --location "D:\Server"
    winget install --id=Microsoft.DirectX -i
)
if "%software_choice%"=="9" (
    mkdir "D:\xampp"
    winget install --id=ApacheFriends.Xampp.8.2 --interactive --location "D:\xampp"
    setx PATH "%PATH%;D:\xampp\php"
)
if "%software_choice%"=="10" winget install --id=Microsoft.VisualStudioCode -i
if "%software_choice%"=="11" winget install --id=Python.Python.3.11 -i
if "%software_choice%"=="12" winget install --id=OpenJS.NodeJS.LTS --silent
if "%software_choice%"=="13" winget install --id=Google.AndroidStudio -i
if "%software_choice%"=="14" winget install --id=Notepad++.Notepad++ -i
if "%software_choice%"=="15" winget install --id=Discord.Discord --silent
if "%software_choice%"=="16" winget install --id=RARLab.WinRAR --silent
if "%software_choice%"=="17" winget install --id=7zip.7zip --silent
if "%software_choice%"=="18" winget install --id=clsid2.mpc-hc --silent
if "%software_choice%"=="19" winget install --id=qBittorrent.qBittorrent --silent
if "%software_choice%"=="20" winget install --id=voidtools.Everything -i
if "%software_choice%"=="21" winget install --id=Valve.Steam --silent
if "%software_choice%"=="22" winget install --id=Jellyfin.JellyfinServer -i
if "%software_choice%"=="23" winget install --id=FileZilla.FileZillaServer -i
if "%software_choice%"=="24" winget install --id=FileZilla.FileZillaClient -i
if "%software_choice%"=="25" winget install --id=Git.Git -i
if "%software_choice%"=="26" winget install --id=ElementLabs.LMStudio -i
if "%software_choice%"=="27" winget install --id=MySQL.MySQL -i
if "%software_choice%"=="28" winget install --id=JetBrains.PhpStorm -i
if "%software_choice%"=="29" winget install --id=TorProject.TorBrowser -i
if "%software_choice%"=="30" (
    curl "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365EduCloudRetail&platform=x64&language=en-us&version=O16GA" --output "C:/OfficeSetup.exe"
    "C:/OfficeSetup.exe"
    del "C:/OfficeSetup.exe"
)
if "%software_choice%"=="31" winget install --id=Microsoft.PowerToys -i
if "%software_choice%"=="32" (
    curl "https://mega.nz/MEGAcmdSetup64.exe" --output "C:/MEGAcmdSetup64.exe"
    "C:/MEGAcmdSetup64.exe"
    del "C:/MEGAcmdSetup64.exe"
)
if "%software_choice%"=="33" (
    curl "https://getcomposer.org/Composer-Setup.exe" --output "C:/Composer-Setup.exe"
    "C:/Composer-Setup.exe"
    del "C:/Composer-Setup.exe"
)
if "%software_choice%"=="34" winget install --id=Proton.ProtonPass -i
if "%software_choice%"=="35" winget install --id=Postman.Postman  -i
if "%software_choice%"=="36" winget install --id=Microsoft.VisualStudio.2022.Community -i
if "%software_choice%"=="37" winget install --id=Microsoft.SQLServer.2022.Developer -i
if "%software_choice%"=="0" goto menu
if "%software_choice%"=="x" exit

echo Done!
pause
goto install_software

:install_games
cls
echo =======================================
echo        SteamCMD Game Installation Menu
echo =======================================
echo [1] Install CS2 Server
echo [2] Install Palworld Server
echo [3] Install Rust Server
echo [4] Install DayZ Server
echo [5] Install Satisfactory Server
echo [6] Install The Forest Server
echo [7] Install Sons Of The Forest Server
echo =======================================
echo [x] Back to Main Menu
echo =======================================
set /p game_choice="Enter your choice (1-7): "


if "%game_choice%"=="1" goto install_cs2
if "%game_choice%"=="2" goto install_palworld
if "%game_choice%"=="3" goto install_rust
if "%game_choice%"=="4" goto install_dayz
if "%game_choice%"=="5" goto install_satisfactory
if "%game_choice%"=="6" goto install_forest
if "%game_choice%"=="7" goto install_sotf
if "%game_choice%"=="0" goto menu

echo Invalid choice! Please enter a valid option.
pause
goto install_games


:install_cs2
echo Installing CS2 Server...
steamcmd +login anonymous +app_update 730 validate +quit
echo CS2 Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_palworld
echo Installing Palworld Server...
steamcmd +login anonymous +app_update 2394010 validate +quit
echo Palworld Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_rust
echo Installing Rust Server...
steamcmd +login anonymous +app_update 258550 validate +quit
echo Rust Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_forest
echo Installing The Forest Server...
steamcmd +login anonymous +app_update 556450 validate +quit
echo The Forest Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_dayz
echo Installing DayZ Server...
steamcmd +login anonymous +app_update 223350 validate +quit
echo DayZ Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_satisfactory
echo Installing Satisfactory Server...
steamcmd +login anonymous +app_update 1690800 validate +quit
echo Satisfactory Server Installed! Press any key to return to the menu...
pause
goto install_games

:install_sotf
echo Installing Sons Of The Forest Server...
steamcmd +login anonymous +app_update 2465200 validate +quit
echo Sons Of The Forest Server Installed! Press any key to return to the menu...
pause
goto install_games

