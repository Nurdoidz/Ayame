﻿[CmdletBinding()]
param(
    [switch] $Force,
    [switch] $Clean,
    [switch] $All,
    [switch] $Neovim,
    [switch] $Stylus,
    [switch] $DotIcon,
    [switch] $SVG,
    [switch] $Template,
    [switch] $OfficeTheme
)

if (!$All -and !($Template -or
                 $Neovim   -or
                 $Stylus   -or
                 $DotIcon  -or
                 $SVG      -or
                 $OfficeTheme)) { $All = $true }

$PrevCWD = Get-Location
Set-Location $PSScriptRoot

. .\src\script\util\ColorConversion.ps1

$AyameColors  = Get-Content '.\src\ayame-colors.json' -Raw | ConvertFrom-Json
$AyameRefPath = '.\bin\ayame.json'

# -- Ayame Reference JSON ------------------------------------------------------

$AyameRef = [ordered]@{
    version = ''
    colors  = [ordered]@{}
}

$AyameRef.version = (Get-Content '.\package.json' -Raw | ConvertFrom-Json).version

foreach ($Color in $AyameColors) {
    $ColorDef      = Convert-HexToRgbHsl $Color.hex
    $ColorDef.uses = $Color.uses

    $AyameRef.colors[$Color.name] = $ColorDef

    foreach ($Alias in $Color.aliases) {
        $AyameRef.colors[$Alias] = $ColorDef
    }
}

$AyameRef | ConvertTo-Json -Depth 3 > $AyameRefPath

# -- Export Scripts ------------------------------------------------------------

if ($All -or $OfficeTheme) { & '.\src\script\export\OfficePrior.ps1' }
if ($All -or $Template -or
             $OfficeTheme) { & '.\src\script\export\Template.ps1'                           -Force:$Force }
if ($All -or $OfficeTheme) { & '.\src\script\export\OfficeAfter.ps1' }
if ($All -or $Neovim)      { & '.\src\script\export\Neovim.ps1'    -Colors $AyameRef.colors -Force:$Force }
if ($All -or $Stylus)      { & '.\src\script\export\Stylus.ps1'    -Colors $AyameRef.colors -Force:$Force }
if ($All -or $DotIcon)     { & '.\src\script\export\DotIcon.ps1'   -Colors $AyameRef.colors -Force:$Force }
if ($All -or $SVG)         { & '.\src\script\export\SVG.ps1'                                -Force:$Force }

Set-Location $PrevCWD
