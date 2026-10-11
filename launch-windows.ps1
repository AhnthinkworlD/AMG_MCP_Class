$ErrorActionPreference = 'Stop'
$env:PYTHONIOENCODING = 'utf-8'
$env:PYTHONUTF8 = '1'
$amgRoot = if ($env:AMG_INSTALL_ROOT) { $env:AMG_INSTALL_ROOT } else { [IO.Path]::Combine([Environment]::GetFolderPath('UserProfile'), 'AMG_MCP_Class') }
$amgPort = if ($env:AMG_PORT) { [int]$env:AMG_PORT } else { 9987 }
$amgLogs = [IO.Path]::Combine($amgRoot, 'logs')
[IO.Directory]::CreateDirectory($amgLogs) | Out-Null
$amgLog = [IO.Path]::Combine($amgLogs, ($env:AMG_MODE + '-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.log'))
$amgExit = 0
$amgTranscript = $false
try {
    Start-Transcript -LiteralPath $amgLog -Force | Out-Null
    $amgTranscript = $true
    Write-Host ('AMG_MCP / ' + $env:AMG_MODE)
    Write-Host ('Package: ' + $env:AMG_PACKAGE_DIR)
    $amgScript = [IO.File]::ReadAllText([IO.Path]::Combine($env:AMG_PACKAGE_DIR, 'install-windows.ps1'))
    $amgParameters = @{ PackageRoot = $env:AMG_PACKAGE_DIR; InstallRoot = $amgRoot; Port = $amgPort }
    if ($env:AMG_MODE -eq 'check') { $amgParameters.CheckOnly = $true }
    & ([ScriptBlock]::Create($amgScript)) @amgParameters
    Write-Host ''
    if ($env:AMG_MODE -eq 'install') {
        Write-Host 'INSTALL OK. Next: open touchdesigner/AMG_MCP_Class_10x10.toe, then double-click 02_Check_Windows.bat.' -ForegroundColor Green
        Write-Host ('AI config folder: ' + $amgRoot)
        if ($env:AMG_NO_OPEN -ne '1') { Start-Process explorer.exe -ArgumentList ('"' + $amgRoot + '"') }
    } else {
        Write-Host 'CHECK OK. The current TD project answered through MCP.' -ForegroundColor Green
        Write-Host 'Compare the project_name above with the file you opened.'
    }
} catch {
    $amgExit = 1
    Write-Host ('FAILED: ' + $_.Exception.Message) -ForegroundColor Red
    if ($env:AMG_MODE -eq 'check') {
        Write-Host 'First install, then open the TD example. Bridge Active must be On; Port must be 9987.'
        Write-Host 'Keep only one TD Bridge active on that port, then run this check again.'
    }
    Write-Host 'See docs/INSTALL_WINDOWS.md and docs/TROUBLESHOOTING.md.'
} finally {
    if ($amgTranscript) { Stop-Transcript | Out-Null }
}
Write-Host ('Log: ' + $amgLog)
exit $amgExit
