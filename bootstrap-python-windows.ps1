param([Parameter(Mandatory=$true)][string]$InstallRoot,
      [Parameter(Mandatory=$true)][string]$PackageRoot)
$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'The class runtime requires 64-bit Windows.' }
$amgMetadata = ([IO.File]::ReadAllText([IO.Path]::Combine($PackageRoot, 'python-runtime-windows.json')) | ConvertFrom-Json)
$amgRuntime = [IO.Path]::Combine($InstallRoot, ('python-' + $amgMetadata.version))
$amgPython = [IO.Path]::Combine($amgRuntime, 'python.exe')
if ([IO.File]::Exists($amgPython)) { return $amgPython }
$amgCache = [IO.Path]::Combine($InstallRoot, 'downloads')
[IO.Directory]::CreateDirectory($amgCache) | Out-Null
$amgZip = [IO.Path]::Combine($amgCache, ('python-' + $amgMetadata.version + '-amd64.zip'))
Write-Host ('Python was not found. Preparing official Python ' + $amgMetadata.version + ' for this class...')
if (-not [IO.File]::Exists($amgZip)) {
    Write-Host 'Downloading from Python.org...'
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $amgDownloader = New-Object Net.WebClient
    try { $amgDownloader.DownloadFile($amgMetadata.url, $amgZip) }
    finally { $amgDownloader.Dispose() }
}
$amgHashEngine = [Security.Cryptography.SHA256]::Create()
$amgHashStream = [IO.File]::OpenRead($amgZip)
try { $amgHash = [BitConverter]::ToString($amgHashEngine.ComputeHash($amgHashStream)).Replace('-', '').ToLowerInvariant() }
finally { $amgHashStream.Dispose(); $amgHashEngine.Dispose() }
if ($amgHash -ne $amgMetadata.sha256) {
    throw ('Python download hash mismatch. Delete this cached ZIP and retry: ' + $amgZip)
}
Write-Host 'Official Python download SHA256: OK'
$amgStage = [IO.Path]::Combine($InstallRoot, ('.python-stage-' + [guid]::NewGuid().ToString('N')))
Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::ExtractToDirectory($amgZip, $amgStage)
$amgStagePython = [IO.Path]::Combine($amgStage, 'python.exe')
& $amgStagePython -c 'import sys,venv,ensurepip; assert sys.version_info[:3] == (3,13,16); print(sys.version.split()[0])' | Out-Host
if ($LASTEXITCODE -ne 0) { throw 'Downloaded Python did not pass its runtime check.' }
if ([IO.Directory]::Exists($amgRuntime)) { throw ('A partial runtime folder already exists: ' + $amgRuntime) }
[IO.Directory]::Move($amgStage, $amgRuntime)
return $amgPython
