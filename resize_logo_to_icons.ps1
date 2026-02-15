# Create all app icon sizes from the source image
Add-Type -AssemblyName System.Drawing

# This script will resize the source logo image to all required iOS icon sizes

$sourceImage = "logo_source.png"
$iconDir = "HebrewAlias\Resources\Assets.xcassets\AppIcon.appiconset"

# Check if source image exists
if (-not (Test-Path $sourceImage)) {
    Write-Host "ERROR: Source image '$sourceImage' not found!" -ForegroundColor Red
    Write-Host "Please save your logo image as 'logo_source.png' in the project root directory"
    exit 1
}

# All required icon sizes for iOS
$sizes = @(20, 29, 40, 58, 60, 76, 80, 87, 100, 102, 108, 114, 120, 128, 144, 152, 167, 172, 180, 196, 216, 234, 256, 258, 512, 1024)

Write-Host "Loading source image: $sourceImage" -ForegroundColor Cyan
$sourceImg = [System.Drawing.Image]::FromFile((Resolve-Path $sourceImage).Path)
Write-Host "Source image size: $($sourceImg.Width)x$($sourceImg.Height)" -ForegroundColor Green

function Resize-Image {
    param(
        [System.Drawing.Image]$sourceImage,
        [int]$targetSize,
        [string]$outputPath
    )
    
    $newImage = New-Object System.Drawing.Bitmap($targetSize, $targetSize)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    
    # High quality resize settings
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    
    # Draw the resized image
    $graphics.DrawImage($sourceImage, 0, 0, $targetSize, $targetSize)
    
    # Save as PNG
    $newImage.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $graphics.Dispose()
    $newImage.Dispose()
}

Write-Host ""
Write-Host "Creating app icons..." -ForegroundColor Cyan

foreach ($size in $sizes) {
    $outputPath = Join-Path $iconDir "$size.png"
    Resize-Image -sourceImage $sourceImg -targetSize $size -outputPath $outputPath
    Write-Host "  Created ${size}x${size}" -ForegroundColor Gray
}

$sourceImg.Dispose()

Write-Host ""
Write-Host "All $($sizes.Count) app icons created successfully!" -ForegroundColor Green
Write-Host "Icons saved to: $iconDir" -ForegroundColor Cyan
