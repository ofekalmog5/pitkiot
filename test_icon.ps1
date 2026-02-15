# Test creating ONE icon to verify it works
Add-Type -AssemblyName System.Drawing

$size = 1024
$bitmap = New-Object System.Drawing.Bitmap($size, $size)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Dark blue background
$darkBlue = [System.Drawing.Color]::FromArgb(45, 74, 92)
$graphics.Clear($darkBlue)

# Large visible text for testing  
$fontSize = 180
$font = New-Object System.Drawing.Font("Segoe UI", $fontSize, [System.Drawing.FontStyle]::Bold)

# White color
$white = [System.Drawing.Brushes]::White
$teal = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(51, 204, 204))

# Draw text centered
$text = "notes"
$textSize = $graphics.MeasureString($text, $font)
$x = ($size - $textSize.Width) / 2
$y = ($size - $textSize.Height) / 2

# Draw the full word first to see if it appears
$graphics.DrawString($text, $font, $white, $x, $y)

# Save test icon
$outputPath = "test_icon_1024.png"
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

Write-Host "Test icon created: $outputPath"
Write-Host "Please open this file to verify the design appears correctly"

$graphics.Dispose()
$bitmap.Dispose()
$font.Dispose()
$teal.Dispose()
