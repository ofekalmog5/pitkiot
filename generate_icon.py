"""Simple icon generator for HebrewAlias app - RGB solid format"""
import struct

def create_png_rgb(width, height, pixels):
    """Create a PNG file in RGB format (no alpha channel)"""
    def png_chunk(chunk_type, data):
        chunk = chunk_type + data
        crc = 0xFFFFFFFF
        for byte in chunk:
            crc ^= byte
            for _ in range(8):
                crc = (crc >> 1) ^ 0xEDB88320 if crc & 1 else crc >> 1
        return struct.pack('>I', len(data)) + chunk + struct.pack('>I', crc ^ 0xFFFFFFFF)
    
    # PNG header
    png = b'\x89PNG\r\n\x1a\n'
    
    # IHDR chunk - RGB format (color type 2)
    ihdr = struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)
    png += png_chunk(b'IHDR', ihdr)
    
    # IDAT chunk (image data)
    raw_data = b''
    for row in pixels:
        raw_data += b'\x00'  # Filter type (no filter)
        raw_data += bytes(row)
    
    import zlib
    compressed = zlib.compress(raw_data, 9)
    png += png_chunk(b'IDAT', compressed)
    
    # IEND chunk
    png += png_chunk(b'IEND', b'')
    
    return png

# Create 1024x1024 solid RGB icon with sticky notes (no transparency)
size = 1024
pixels = []

for y in range(size):
    row = []
    for x in range(size):
        # Gradient background (warm paper)
        ratio = y / size
        r = int(255 * (1 - ratio * 0.08))
        g = int(242 * (1 - ratio * 0.12))
        b = int(217 * (1 - ratio * 0.18))
        
        # Draw colorful rectangles (sticky notes) - solid colors only
        # Yellow note (top-left)
        if 280 < x < 520 and 220 < y < 480:
            r, g, b = 255, 255, 150
        # Blue note (center)
        elif 460 < x < 700 and 420 < y < 620:
            r, g, b = 150, 210, 255
        # Pink note (bottom)
        elif 320 < x < 560 and 580 < y < 800:
            r, g, b = 255, 210, 220
        
        row.extend([r, g, b])
    pixels.append(row)

output_path = 'HebrewAlias/Resources/Assets.xcassets/AppIcon.appiconset/icon-1024.png'
png_data = create_png_rgb(size, size, pixels)

with open(output_path, 'wb') as f:
    f.write(png_data)

print(f"✅ Created app icon (RGB, no transparency)")
print(f"   Path: {output_path}")
print(f"   Size: 1024x1024px")
print(f"   Format: RGB (solid colors only)")


