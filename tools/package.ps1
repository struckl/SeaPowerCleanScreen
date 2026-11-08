<#
.SYNOPSIS
    Builds a release of Sea Power Clean Screen and stages the folder that goes to the Steam Workshop.

.DESCRIPTION
    Release build without the automatic deploy, then dist\SeaPowerCleanScreen\ with exactly what players get:
    SeaPowerCleanScreen.dll, _info.ini, lang\*.ini, LICENSE.txt and preview.jpg â€“ the Workshop preview (workshop\preview.jpg, if
    present), which the game's upload screen only lets you pick from inside StreamingAssets.
    With -Install the staged folder also replaces <GameDir>\Sea Power_Data\StreamingAssets\SeaPowerCleanScreen\, the
    folder to pick in the game's Create Mod screen. Sea Power must be closed for that.

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File tools\package.ps1 -Install
#>
param(
    [string]$GameDir = $(if ($env:GameDir) { $env:GameDir } else { 'E:\Games\steamapps\common\Sea Power' }),
    [switch]$Install
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$project = Join-Path $root 'src\SeaPowerCleanScreen\SeaPowerCleanScreen.csproj'
$dist = Join-Path $root 'dist\SeaPowerCleanScreen'

dotnet build $project -c Release -p:Deploy=false -p:GameDir="$GameDir"
if ($LASTEXITCODE -ne 0) { throw 'Build failed.' }

$out = Join-Path $root 'src\SeaPowerCleanScreen\bin\Release\netstandard2.1'
if (Test-Path $dist) { Remove-Item -Recurse -Force $dist }
New-Item -ItemType Directory -Force $dist | Out-Null
Copy-Item (Join-Path $out 'SeaPowerCleanScreen.dll') $dist
Copy-Item (Join-Path $root 'src\SeaPowerCleanScreen\mod\_info.ini') $dist
Copy-Item (Join-Path $root 'LICENSE') (Join-Path $dist 'LICENSE.txt')
$preview = Join-Path $root 'workshop\preview.jpg'
if (Test-Path $preview) { Copy-Item $preview $dist } else { Write-Warning 'workshop\preview.jpg missing - nothing to pick as the Workshop preview.' }

$version = (Select-String -Path (Join-Path $root 'src\SeaPowerCleanScreen\Plugin.cs') -Pattern 'Version = "([^"]+)"').Matches[0].Groups[1].Value
Write-Host "Staged Sea Power Clean Screen $version in $dist"

if ($Install) {
    if (Get-Process -Name 'Sea Power' -ErrorAction SilentlyContinue) { throw 'Sea Power is running - close it first.' }
    $target = Join-Path $GameDir 'Sea Power_Data\StreamingAssets\SeaPowerCleanScreen'
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    Copy-Item -Recurse $dist $target
    Write-Host "Installed to $target - pick this folder in Mods > Create Mod."
}

