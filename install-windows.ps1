param(
    [switch]$CheckOnly,
    [int]$Port = 9987,
    [string]$InstallRoot = '',
    [string]$PackageRoot = $PSScriptRoot
)
$ErrorActionPreference = 'Stop'
if (-not $InstallRoot) { $InstallRoot = [IO.Path]::Combine([Environment]::GetFolderPath('UserProfile'), 'AMG_MCP_Class') }
$amgArguments = @(([IO.Path]::Combine($PackageRoot, 'install.py')), '--port', [string]$Port, '--root', $InstallRoot)
if ($CheckOnly) { $amgArguments += '--check-only' }
$amgCandidates = @()
foreach ($amgPrivatePath in @([IO.Path]::Combine($InstallRoot, '.venv\Scripts\python.exe'), [IO.Path]::Combine($InstallRoot, 'python-3.13.16\python.exe'))) {
    if ([IO.File]::Exists($amgPrivatePath)) { $amgCandidates += @{ File=$amgPrivatePath; Prefix=@() } }
}
# The test flag hides all external Python commands; students never set it.
if ($env:AMG_FORCE_BOOTSTRAP -ne '1') {
    foreach ($amgDir in ($env:PATH -split ';')) {
        if (-not $amgDir) { continue }
        $amgCandidate = [IO.Path]::Combine($amgDir.Trim('"'), 'python.exe')
        if ([IO.File]::Exists($amgCandidate) -and $amgCandidate -notlike '*WindowsApps*') {
            $amgCandidates += @{ File=$amgCandidate; Prefix=@() }
        }
    }
    $amgLauncher = [IO.Path]::Combine($env:WINDIR, 'py.exe')
    if ([IO.File]::Exists($amgLauncher)) {
        foreach ($amgVersion in @('-3','-3.11','-3.12','-3.13','-3.14','-3.15','-3.10')) {
            $amgCandidates += @{ File=$amgLauncher; Prefix=@($amgVersion) }
        }
    }
}
$amgSelected = $null
foreach ($amgCandidate in $amgCandidates) {
    try {
        $amgProbeArgs = @($amgCandidate.Prefix) + @('-c','import sys; raise SystemExit(0 if sys.version_info >= (3,10) else 1)')
        & $amgCandidate.File @amgProbeArgs 2>$null
        if ($LASTEXITCODE -eq 0) { $amgSelected = $amgCandidate; break }
    } catch { }
}
if ($null -eq $amgSelected) {
    if ($CheckOnly) { throw 'No class Python environment. Run 01_Install_Windows.bat first.' }
    $amgBootstrap = [IO.File]::ReadAllText([IO.Path]::Combine($PackageRoot, 'bootstrap-python-windows.ps1'))
    $amgPython = & ([ScriptBlock]::Create($amgBootstrap)) -InstallRoot $InstallRoot -PackageRoot $PackageRoot
    $amgSelected = @{ File=[string]$amgPython; Prefix=@() }
}
Write-Host ('Using Python: ' + $amgSelected.File)
$amgRunArgs = @($amgSelected.Prefix) + $amgArguments
& $amgSelected.File @amgRunArgs | Out-Host
if ($LASTEXITCODE -ne 0) { throw ('AMG installer returned exit code ' + $LASTEXITCODE) }
