# Create all required app icon sizes with custom design
Add-Type -AssemblyName System.Drawing

$iconDir = "HebrewAlias\Resources\Assets.xcassets\AppIcon.appiconset"

# Define all required sizes for iPhone
$sizes = @(20, 29, 40, 58, 60, 76, 80, 87, 100, 102, 108, 114, 120, 128, 144, 152, 167, 172, 180, 196, 216, 234, 256, 258, 512, 1024)

function Create-Icon {
    param([int]$size)
    
    $bitmap = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    
    # Dark blue background
    $darkBlue = [System.Drawing.Color]::FromArgb(45, 74, 92)
    $graphics.Clear($darkBlue)
    
    # Calculate font size based on icon size
    $fontSize = [math]::Max(8, $size * 0.18)
    $font = New-Object System.Drawing.Font("Segoe UI", $fontSize, [System.Drawing.FontStyle]::Bold)
    
    # Measure text to position it
    $textN = "n"
    $textO = "o"
    $textTes = "tes"
    
    $sizeN = $graphics.MeasureString($textN, $font)
    $sizeO = $graphics.MeasureString($textO, $font)
    $sizeT = $graphics.MeasureString($textTes, $font)
    
    $totalWidth = $sizeN.Width + $sizeO.Width + $sizeT.Width - ($fontSize * 0.3)
    $baseX = ($size - $totalWidth) / 2
    $baseY = ($size - $sizeN.Height) / 2 + ($fontSize * 0.1)
    
    # White color for text
    $white = [System.Drawing.Brushes]::White
    
    # Draw "n"
    $graphics.DrawString($textN, $font, $white, $baseX, $baseY)
    $baseX += $sizeN.Width - ($fontSize * 0.15)
    
    # Draw "o" in teal
    $teal = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(51, 204, 204))
    $graphics.DrawString($textO, $font, $teal, $baseX, $baseY)
    $baseX += $sizeO.Width - ($fontSize * 0.15)
    
    # Draw "tes"
    $graphics.DrawString($textTes, $font, $white, $baseX, $baseY)
    
    # Save
    $outputPath = Join-Path $iconDir "$size.png"
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $graphics.Dispose()
    $bitmap.Dispose()
    $font.Dispose()
    $teal.Dispose()
}

Write-Host "Creating app icons with custom design..."

foreach ($size in $sizes) {
    Create-Icon -size $size
    Write-Host "Created ${size}x${size} icon"
}

Write-Host ""
Write-Host "All app icons created successfully in: $iconDir" -ForegroundColor Green
