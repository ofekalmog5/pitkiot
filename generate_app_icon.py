#!/usr/bin/env python3
"""
Generate iOS app icon with the 'notes' design
Dark blue background with white 'notes' text and teal circle overlay
"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_notes_icon(size=1024):
    # Create image with dark blue background
    img = Image.new('RGB', (size, size), color=(33, 64, 89))  # RGB for dark blue
    draw = ImageDraw.Draw(img)
    
    # Try to use a bold system font
    try:
        font_size = int(size * 0.15)  # Scale font to image size
        font = ImageFont.truetype("Arial Bold.ttf", font_size)
    except:
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", int(size * 0.15))
        except:
            font = ImageFont.load_default()
    
    # Draw white 'notes' text
    text = "notes"
    # Get text bounding box
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    # Center text
    x = (size - text_width) // 2
    y = (size - text_height) // 2
    
    draw.text((x, y), text, fill=(255, 255, 255), font=font)
    
    # Draw teal circle overlay (positioned over the 'o' in notes)
    # Calculate circle position (slightly left of center)
    circle_size = int(size * 0.23)  # 240px at 1024px
    circle_thickness = int(size * 0.034)  # 35px at 1024px
    circle_x = size // 2 - int(size * 0.078)  # -80px offset at 1024px
    circle_y = size // 2
    
    # Draw circle outline
    for i in range(circle_thickness):
        draw.ellipse(
            [circle_x - circle_size//2 + i, 
             circle_y - circle_size//2 + i,
             circle_x + circle_size//2 - i, 
             circle_y + circle_size//2 - i],
            outline=(51, 204, 204),  # Teal/turquoise color
            width=1
        )
    
    # Apply rounded corners for iOS app icon
    # Create alpha mask for rounded corners
    mask = Image.new('L', (size, size), 0)
    mask_draw = ImageDraw.Draw(mask)
    corner_radius = int(size * 0.2235)  # iOS 18 corner radius ratio
    mask_draw.rounded_rectangle([(0, 0), (size, size)], radius=corner_radius, fill=255)
    
    # Apply mask
    output = Image.new('RGB', (size, size), (255, 255, 255))
    output.paste(img, (0, 0))
    
    return output

def main():
    print("Generating app icon...")
    
    # Generate 1024x1024 icon
    icon = create_notes_icon(1024)
    
    # Save to resources directory
    output_dir = "HebrewAlias/Resources/Assets.xcassets/AppIcon.appiconset"
    os.makedirs(output_dir, exist_ok=True)
    
    output_path = os.path.join(output_dir, "icon-1024.png")
    icon.save(output_path, "PNG")
    print(f"✅ Icon saved to: {output_path}")
    
    # Also save a preview
    preview = create_notes_icon(512)
    preview.save("app_icon_preview.png", "PNG")
    print(f"✅ Preview saved to: app_icon_preview.png")
    
    print("\n📝 Next steps:")
    print("1. Update Contents.json in AppIcon.appiconset to reference icon-1024.png")
    print("2. Build and install the app to see the new icon")

if __name__ == "__main__":
    main()
