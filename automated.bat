@echo off
title Automated Windows Tweaking Utility by @Saad1430
cls
echo Enabling Classic Context Menu...
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
echo Enabling Windows Photo Viewer...
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .jpg /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .jpeg /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .png /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .bmp /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .gif /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .tif /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKLM\Software\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v .tiff /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
echo Moving Taskbar Icons to Left...
if "%tbchoice%"=="1" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f
echo Making Search just an icon...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f
echo Removing Task View Button...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
echo Changing timezone to Asia/Karachi...
tzutil /s "Pakistan Standard Time"
echo Creating black wallpaper...
powershell -Command "$img = [System.IO.File]::WriteAllBytes('C:\\blackwallpaper.bmp', [byte[]](0x42, 0x4D, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))"
echo Making Wallpaper Black...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\\blackwallpaper.bmp" /f
rundll32.exe user32.dll,UpdatePerUserSystemParameters
echo Uninstalling Edge Browser (finally)...
winget uninstall microsoft.edge
echo Installing Softwares...
winget install --id=Brave.Brave -i
winget install --id=Mozilla.Firefox -i
winget install --id=Ditto.Ditto --silent
winget install --id=Tonec.InternetDownloadManager -i
winget install --id=Google.Drive -i
winget install --id=Python.Python.3.11 -i
winget install --id=OpenJS.NodeJS.LTS --silent
winget install --id=voidtools.Everything -i
winget install --id=Git.Git -i
winget install --id=Postman.Postman  -i
mkdir "D:\xampp"
winget install --id=ApacheFriends.Xampp.8.2 -i
winget install --id=Microsoft.VisualStudioCode -i
winget install --id=Notepad++.Notepad++ -i
winget install --id=Discord.Discord --silent
winget install --id=RARLab.WinRAR --silent
winget install --id=qBittorrent.qBittorrent --silent
winget install --id=Microsoft.DirectX -i
mkdir "D:\Server"
winget install --id=Valve.SteamCMD --silent --location "D:\Server"
echo Installing softwares not available on winget...
curl "https://mega.nz/MEGAcmdSetup64.exe" --output "C:/MEGAcmdSetup64.exe"
"C:/MEGAcmdSetup64.exe"
del "C:/MEGAcmdSetup64.exe"
curl "https://getcomposer.org/Composer-Setup.exe" --output "C:/Composer-Setup.exe"
"C:/Composer-Setup.exe"
del "C:/Composer-Setup.exe"
curl "https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe" --output "C:/dx.exe"
"C:/dx.exe"
del "C:/dx.exe"
echo Writing Environment Variable Paths...
setx PATH "%PATH%;D:\xampp\php"
setx PATH "%PATH%;D:\Server"
echo Installing Palworld Server...
steamcmd +login anonymous +app_update 2394010 validate +quit
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Done!
echo Thank you for using Automated Tweaking Utility
pause
cls
echo Press any key to exit or enter F to restart system...
set /p choice="Enter F to restart: "
if "%choice%"=="F" shutdown /r /f /t 0
if "%choice%"=="" exit
