@echo off
set src="C:\Users\admin\Documents\builds\obs-studio-pixel-match-switcher\rundir\Release"
set dst="C:\Users\admin\Documents\obs-studio-pixel-match-switcher\UI\installer\new\core"
set extra="C:\Users\admin\Documents\Releases\extra"
set live="C:\Users\admin\Documents\Releases\live"
set saveloc="C:\Users\admin\Documents\Releases"

rmdir /S /Q "%dst%"

mkdir "%dst%\data\obs-studio\license"
copy "%dst%\..\gplv2.txt" "%dst%\data\obs-studio\license"

robocopy /E "%src%\bin" "%dst%\bin"
robocopy /E "%src%\data" "%dst%\data"
robocopy /E "%src%\obs-plugins" "%dst%\obs-plugins"

robocopy /E "%extra%" "%dst%"

makensis /DOutFile=%saveloc%\obs-studio-with-pixel-match-switcher-0.xx.x-bundle-x64.exe mp-installer.nsi

robocopy /E "%live%" "%dst%"

makensis /DOutFile=%saveloc%\obs-studio-with-pixel-match-switcher-0.xx.0-bundle-live-x64.exe mp-installer.nsi
