<#
.SYNOPSIS
    Stages the folder of Sea Power Clean Screen that goes to the Steam Workshop. The mod has no code: two ini files.

.DESCRIPTION
    dist\SeaPowerCleanScreen\ gets exactly what players get: _info.ini, config_patch.ini, LICENSE.txt and preview.jpg (the Workshop
    preview, which the game's upload screen only lets you pick from inside StreamingAssets).
    With -Install the staged folder also replaces <GameDir>\Sea Power_Data\StreamingAssets\SeaPowerCleanScreen\ (the folder to pick in
    the game's Create Mod screen), which also removes the DLL of version 0.1.0. Sea Power must be closed for that.

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File tools\package.ps1 -Install
#>
param(
    [string]$GameDir = $(if ($env:GameDir) { $env:GameDir } else { 'E:\Games\steamapps\common\Sea Power' }),
    [switch]$Install
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$dist = Join-Path $root 'dist\SeaPowerCleanScreen'

if (Test-Path $dist) { Remove-Item -Recurse -Force $dist }
New-Item -ItemType Directory -Force $dist | Out-Null
Copy-Item (Join-Path $root 'mod\_info.ini') $dist
Copy-Item (Join-Path $root 'mod\config_patch.ini') $dist
Copy-Item (Join-Path $root 'LICENSE') (Join-Path $dist 'LICENSE.txt')
$preview = Join-Path $root 'workshop\preview.jpg'
if (Test-Path $preview) { Copy-Item $preview $dist } else { Write-Warning 'workshop\preview.jpg missing - nothing to pick as the Workshop preview.' }

$version = (Get-Content (Join-Path $root 'VERSION') -TotalCount 1).Trim()
Write-Host "Staged Sea Power Clean Screen $version in $dist"

if ($Install) {
    if (Get-Process 'Sea Power' -ErrorAction SilentlyContinue) { throw 'Sea Power is running - close it first.' }
    $target = Join-Path $GameDir 'Sea Power_Data\StreamingAssets\SeaPowerCleanScreen'
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    Copy-Item -Recurse $dist $target
    Write-Host "Installed to $target - pick this folder in Mods > Create Mod."
}
