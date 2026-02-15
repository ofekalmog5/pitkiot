# PowerShell script to create the notes app icon
Add-Type -AssemblyName System.Drawing

# Create 1024x1024 bitmap
$width = 1024
$height = 1024
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# Enable anti-aliasing for smooth text
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Dark blue background (#2d4a5c)
$backgroundColor = [System.Drawing.Color]::FromArgb(45, 74, 92)
$graphics.Clear($backgroundColor)

# Create fonts
$fontFamily = "Segoe UI"
$fontSize = 180
$fontStyle = [System.Drawing.FontStyle]::Bold
$font = New-Object System.Drawing.Font($fontFamily, $fontSize, $fontStyle)

# White color for most letters
$whiteColor = [System.Drawing.Color]::White
$whiteBrush = New-Object System.Drawing.SolidBrush($whiteColor)

# Teal color for 'o' (#33cccc)
$tealColor = [System.Drawing.Color]::FromArgb(51, 204, 204)
$tealBrush = New-Object System.Drawing.SolidBrush($tealColor)

# Calculate positions (centered)
$baseX = 200
$baseY = 380

# Draw "n" in white
$graphics.DrawString("n", $font, $whiteBrush, $baseX, $baseY)

# Draw "o" in teal  
$graphics.DrawString("o", $font, $tealBrush, $baseX + 130, $baseY)

# Draw "tes" in white
$graphics.DrawString("tes", $font, $whiteBrush, $baseX + 260, $baseY)

# Save the image
$outputPath = Join-Path $PSScriptRoot "HebrewAlias\Resources\Assets.xcassets\AppIcon.appiconset\icon-1024.png"
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

Write-Host "App icon created successfully at: $outputPath"

# Clean up
$graphics.Dispose()
$bitmap.Dispose()
$font.Dispose()
$whiteBrush.Dispose()
$tealBrush.Dispose()
