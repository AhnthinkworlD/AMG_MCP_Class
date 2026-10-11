@echo off
setlocal EnableExtensions DisableDelayedExpansion
chcp 65001 >nul
set "AMG_PACKAGE_DIR=%~dp0"
set "AMG_MODE=install"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$s = [IO.File]::ReadAllText([IO.Path]::Combine($env:AMG_PACKAGE_DIR, 'launch-windows.ps1')); & ([ScriptBlock]::Create($s))"
set "AMG_EXIT=%ERRORLEVEL%"
echo.
if not "%AMG_NO_PAUSE%"=="1" pause
exit /b %AMG_EXIT%
