from PIL import Image, ImageDraw, ImageFont
import os

def create_notes_icon():
    """Create the 'notes' app icon with teal 'o' on dark blue background"""
    
    # Create 1024x1024 image
    size = 1024
    img = Image.new('RGB', (size, size), color='#2d4a5c')
    draw = ImageDraw.Draw(img)
    
    # Try to use a clean sans-serif font
    try:
        # Try common sans-serif fonts
        font = ImageFont.truetype("arial.ttf", 180)
    except:
        try:
            font = ImageFont.truetype("C:\\Windows\\Fonts\\arial.ttf", 180)
        except:
            try:
                font = ImageFont.truetype("C:\\Windows\\Fonts\\segoeui.ttf", 180)
            except:
                # Fallback to default
                font = ImageFont.load_default()
    
    # Draw "n" in white
    draw.text((200, 380), "n", fill='white', font=font)
    
    # Draw "o" in teal
    draw.text((330, 380), "o", fill='#33cccc', font=font)
    
    # Draw "tes" in white
    draw.text((460, 380), "tes", fill='white', font=font)
    
    # Save the icon
    output_path = os.path.join(
        os.path.dirname(__file__),
        'HebrewAlias',
        'Resources',
        'Assets.xcassets',
        'AppIcon.appiconset',
        'icon-1024.png'
    )
    
    img.save(output_path)
    print(f"✓ App icon created successfully at: {output_path}")
    print(f"  Size: {size}x{size}px")
    print(f"  Design: 'notes' with teal 'o' on dark blue background")

if __name__ == "__main__":
    create_notes_icon()
