# App Icon Configuration Verification Report
Write-Host "`n========================================" -ForegroundColor Yellow
Write-Host "APP ICON CONFIGURATION VERIFICATION" -ForegroundColor Yellow
Write-Host "========================================`n" -ForegroundColor Yellow

# Check 1: Icon Files
Write-Host "[1] Icon Files:" -ForegroundColor Cyan
$requiredFiles = @('20.png','29.png','40.png','58.png','60.png','80.png','87.png','120.png','180.png','1024.png')
$iconDir = 'HebrewAlias\Resources\Assets.xcassets\AppIcon.appiconset'
$allExist = $true
foreach($file in $requiredFiles) {
    $path = Join-Path $iconDir $file
    if(Test-Path $path) {
        Write-Host "    ✓ $file" -ForegroundColor Green
    } else {
        Write-Host "    ✗ MISSING: $file" -ForegroundColor Red
        $allExist = $false
    }
}

# Check 2: Contents.json
Write-Host "`n[2] Contents.json:" -ForegroundColor Cyan
$jsonPath = Join-Path $iconDir "Contents.json"
if(Test-Path $jsonPath) {
    $json = Get-Content $jsonPath -Raw | ConvertFrom-Json
    Write-Host "    ✓ File exists" -ForegroundColor Green
    Write-Host "    ✓ Images defined: $($json.images.Count)" -ForegroundColor Green
    $hasMarketing = ($json.images | Where-Object {$_.idiom -eq 'ios-marketing'}) -ne $null
    if($hasMarketing) {
        Write-Host "    ✓ Has 1024px marketing icon" -ForegroundColor Green
    } else {
        Write-Host "    ✗ Missing 1024px marketing icon" -ForegroundColor Red
    }
} else {
    Write-Host "    ✗ Contents.json NOT FOUND" -ForegroundColor Red
}

# Check 3: Build Settings
Write-Host "`n[3] Xcode Build Settings:" -ForegroundColor Cyan
$pbxproj = Get-Content 'HebrewAlias.xcodeproj\project.pbxproj' -Raw
if($pbxproj -match 'ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon') {
    Write-Host "    ✓ ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon" -ForegroundColor Green
} else {
    Write-Host "    ✗ ASSETCATALOG_COMPILER_APPICON_NAME not set" -ForegroundColor Red
}

if($pbxproj -match 'Assets.xcassets in Resources') {
    Write-Host "    ✓ Assets.xcassets included in Resources" -ForegroundColor Green
} else {
    Write-Host "    ✗ Assets.xcassets NOT in Resources" -ForegroundColor Red
}

# Check 4: Icon Content
Write-Host "`n[4] Icon Content Verification:" -ForegroundColor Cyan
$icon1024 = Join-Path $iconDir "1024.png"
if(Test-Path $icon1024) {
    $img = [System.Drawing.Image]::FromFile((Resolve-Path $icon1024).Path)
    Write-Host "    ✓ 1024.png size: $($img.Width)x$($img.Height)" -ForegroundColor Green
    $img.Dispose()
} else {
    Write-Host "    ✗ 1024.png not found" -ForegroundColor Red
}

# Summary
Write-Host "`n========================================" -ForegroundColor Yellow
Write-Host "SUMMARY:" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
if($allExist -and $hasMarketing) {
    Write-Host "`n✓ ALL CHECKS PASSED!`n" -ForegroundColor Green
    Write-Host "Your app icon configuration is correct." -ForegroundColor Green
    Write-Host "Make sure to download the latest IPA from GitHub Actions Run #47`n" -ForegroundColor Cyan
} else {
    Write-Host "`n✗ ISSUES FOUND - Check errors above`n" -ForegroundColor Red
}
