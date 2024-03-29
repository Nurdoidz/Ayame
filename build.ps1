$PrevCWD = (Get-Item .).FullName
Set-Location $PSScriptRoot

$Ayame = Get-Content '.\src\ayame-colors.json' -Raw | ConvertFrom-Json

# --( Path Variables )----------------------------------------------------------

$AyameJsonPath = '.\build\out\ayame.json'
$AyameVariablesPath = '.\src\ayame-variables.styl'
$AyameHexPath = '.\src\ayame-hex.styl'
$AyameRGBPath = '.\src\ayame-rgb.styl'
$AyameHSLPath = '.\src\ayame-hsl.styl'
$IconsPath = '.\build\out\icon'
$ReadmePath = '.\README.md'
$ReadmeTemplatePath = '.\src\readme-template.md'

# --( ayame-colors.json )-------------------------------------------------------

function Convert-HexToRgbHsl {
    param(
        [string]
        $HexColor
    )

    # Calculate RGB. r[0,255], g[0,255], b[0,255]
    $HexColor = $HexColor.TrimStart('#')

    $r = [convert]::ToInt32($HexColor.Substring(0, 2), 16)
    $g = [convert]::ToInt32($HexColor.Substring(2, 2), 16)
    $b = [convert]::ToInt32($HexColor.Substring(4, 2), 16)

    # Calculate RGB. r_percent[0,1], g_percent[0,1], b_percent[0,1]
    $r_percent = $r / 255
    $g_percent = $g / 255
    $b_percent = $b / 255

    # Prepare to calculate HSL.
    $max = [math]::Max($r_percent, $g_percent)
    $max = [math]::Max($max, $b_percent)
    $min = [math]::Min($r_percent, $g_percent)
    $min = [math]::Min($min, $b_percent)
    $delta = $max - $min

    # Calculate hue. h[0,360]
    if ($delta -eq 0) { $h = 0 }
    elseif ($max -eq $r_percent) {
        $segment = ($g_percent - $b_percent) / $delta
        if ($segment -lt 0) { $shift = 360 / 60 }
        else { $shift = 0 }
        $h = $segment + $shift
    }
    elseif ($max -eq $g_percent) {
        $segment = ($b_percent - $r_percent) / $delta
        $shift = 120 / 60
        $h = $segment + $shift
    }
    else {
        $segment = ($r_percent - $g_percent) / $delta
        $shift = 240 / 60
        $h = $segment + $shift
    }
    $h *= 60

    # Calculate lightness. l[0,1]
    $l = ($max + $min) / 2

    # Calculate saturation. s[0,1]
    if ($delta -eq 0) {
        $s = 0
    }
    else {
        $s = $delta / (1 - [math]::Abs(2 * $l - 1))
    }

    return [ordered]@{
        hex = "#$HexColor"
        r = $r
        red = $r
        red_percent = $r_percent
        g = $g
        green = $g
        green_percent = $g_percent
        b = $b
        blue = $b
        blue_percent = $b_percent
        rgb = "rgb($r, $g, $b)"
        h = $h
        hue = $h
        s = $s
        saturation = $s
        l = $l
        lightness = $l
        hsl = "hsl($([math]::Round($h)), $([math]::Round($s * 100))%, $([math]::Round($l * 100))%)"
    }
}

$AyameJson = [ordered]@{
    version = ''
    colors = [ordered]@{}
}

$AyameJson.version = (Get-Content .\package.json -Raw | ConvertFrom-Json).version

foreach ($Color in $Ayame.colors) {
    $v = Convert-HexToRgbHsl $Color.hex
    $AyameJson.colors[$Color.name] = $v
    foreach ($Alias in $Color.aliases) {
        $AyameJson.colors[$Alias] = $v
    }
}

$AyameJson | ConvertTo-Json > $AyameJsonPath

# --( ayame-variables.styl )----------------------------------------------------

$Prefix = '--ayame-'

Set-Content -Path $AyameVariablesPath -Value @"
$(($Ayame.colors | ForEach-Object {
    $Comment = ''
    if ($_.uses -gt 0) {
        $Comment = " // $($_.uses -Join ', ')"
    }
    "aya-$($_.name) = var($Prefix$($_.name))$Comment"
}) -Join "`n")
$(($Ayame.colors | Where-Object { $_.aliases } | ForEach-Object {
    $ThisColor = $_
    ($_.aliases | ForEach-Object {
        $Comment = ''
        if ($ThisColor.uses -gt 0) {
            $Comment = " // $($ThisColor.uses -Join ', ')"
        }
        "aya-$_ = var($Prefix$_)$Comment"
    }) -Join "`n"
}) -Join "`n")
:root
$(($Ayame.colors | ForEach-Object {
    $Comment = ''
    if ($_.uses -gt 0) {
        $Comment = " /* $($_.uses -Join ', ') */"
    }
    "    $($Prefix)$($_.name) $($AyameJson.colors[$_.name].hex);$Comment"
}) -Join "`n")
$(($Ayame.colors | Where-Object { $_.aliases } | ForEach-Object {
    $ThisColor = $_
    ($_.aliases | ForEach-Object {
        $Comment = ''
        if ($ThisColor.uses -gt 0) {
            $Comment = " /* $($ThisColor.uses -Join ', ') */"
        }
        "    $($Prefix)$_ aya-$($ThisColor.name);$Comment"
    }) -Join "`n"
}) -Join "`n")
"@

# --( ayame-hex.styl )----------------------------------------------------------

Set-Content -Path $AyameHexPath -Value @"
$(($Ayame.colors | ForEach-Object {
    $Comment = ''
    if ($_.uses -gt 0) {
        $Comment = " // $($_.uses -Join ', ')"
    }
    "ayahex-$($_.name) = $($AyameJson.colors[$_.name].hex)$Comment"
}) -Join "`n")
$(($Ayame.colors | Where-Object { $_.aliases } | ForEach-Object {
    $ThisColor = $_
    ($_.aliases | ForEach-Object {
        $Comment = ''
        if ($ThisColor.uses -gt 0) {
            $Comment = " // $($ThisColor.uses -Join ', ')"
        }
        "ayahex-$_ = $($AyameJson.colors[$ThisColor.name].hex)$Comment"
    }) -Join "`n"
}) -Join "`n")
"@

# --( ayame-rgb.styl )----------------------------------------------------------

Set-Content -Path $AyameRGBPath -Value @"
$(($Ayame.colors | ForEach-Object {
    $Comment = ''
    if ($_.uses -gt 0) {
        $Comment = " // $($_.uses -Join ', ')"
    }
    "ayargb-$($_.name) = $($AyameJson.colors[$_.name].rgb)$Comment"
}) -Join "`n")
$(($Ayame.colors | Where-Object { $_.aliases } | ForEach-Object {
    $ThisColor = $_
    ($_.aliases | ForEach-Object {
        $Comment = ''
        if ($ThisColor.uses -gt 0) {
            $Comment = " // $($ThisColor.uses -Join ', ')"
        }
        "ayargb-$_ = $($AyameJson.colors[$ThisColor.name].rgb)$Comment"
    }) -Join "`n"
}) -Join "`n")
"@

# --( ayame-hsl.styl )----------------------------------------------------------

Set-Content -Path $AyameHSLPath -Value @"
$(($Ayame.colors | ForEach-Object {
    $Comment = ''
    if ($_.uses -gt 0) {
        $Comment = " // $($_.uses -Join ', ')"
    }
    "ayahsl-$($_.name) = $($AyameJson.colors[$_.name].hsl)$Comment"
}) -Join "`n")
$(($Ayame.colors | Where-Object { $_.aliases } | ForEach-Object {
    $ThisColor = $_
    ($_.aliases | ForEach-Object {
        $Comment = ''
        if ($ThisColor.uses -gt 0) {
            $Comment = " // $($ThisColor.uses -Join ', ')"
        }
        "ayahsl-$_ = $($AyameJson.colors[$ThisColor.name].hsl)$Comment"
    }) -Join "`n"
}) -Join "`n")
"@

# --( out/icon/*.svg ) ---------------------------------------------------------

if (Test-Path $IconsPath) {
    Get-ChildItem $IconsPath | ForEach-Object { Remove-Item $_ -Recurse }
}
else {
    New-Item -ItemType Directory -Path $IconsPath -Force | Out-Null
}

foreach ($Color in $Ayame.colors) {
    $SVGPath = Join-Path -Path $IconsPath -ChildPath "$($Color.name).svg"
    $SVGContent = @"
<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
  <circle cx="8" cy="8" r="8" fill="$($AyameJson.colors[$Color.name].hex)" />
</svg>
"@
    New-Item -Path $SVGPath -Value $SVGContent | Out-Null
}

# --( README.md ) --------------------------------------------------------------

$IconURL = 'https://raw.githubusercontent.com/Nurdoidz/Ayame/master/build/out/icon/'

# Don’t waste three hours of your life like me and just accept the assignment
$Backtick = "``"

$AyamePaletteTable = ($Ayame.colors | ForEach-Object {
    @(
        "| ![]($($IconURL)$($_.name).svg) ``$($AyameJson.colors[$_.name].hex)`` |",
        " ``$($_.name)``",
        "$($_.aliases.Count -gt 0 ? ', ' : '')",
        "$(($_.aliases | ForEach-Object {
            "$Backtick$_$Backtick"
        }) -Join ', ') |",
        " $($_.uses -Join ', ') |"
    ) -Join ''
}) -Join "`n"

(Get-Content $ReadmeTemplatePath).Replace('@-ayame-palette-table', $AyamePaletteTable) | Set-Content $ReadmePath

# --( *.ayame-template* ) -----------------------------------------------------

$Values = @{
    ayame = Get-Content $AyameJsonPath -Raw | ConvertFrom-Json
}

$Pattern = [regex]'\[{2}(ayame):(\w+(?:\.\w+)*)\]{2}'

Get-ChildItem .\src\ -Filter '*.ayame-template*' | ForEach-Object {
    $Content = Get-Content $_.FullName
    for ($i = 0; $i -lt $Content.Length; $i++) {
        $Content[$i] = $Pattern.Replace($Content[$i], {
            param($Match)
            $Json = $Match.Groups[1].Value
            $Key = $Match.Groups[2].Value
            $Object = $Values.$Json
            foreach ($SubKey in $Key.Split('.')) {
                $Object = $Object.$SubKey
            }
            $Object
        })
    }
    $Content > ".\build\out\$($_.Name)".Replace('.ayame-template', '')
}

Set-Location $PrevCWD

# --( Stylus ) -----------------------------------------------------------------

npx stylus src/ayame-variables.styl
npx stylus src/usercss --out build/out/usercss
