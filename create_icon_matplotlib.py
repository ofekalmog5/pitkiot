import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import FancyBboxPatch
import os

def create_notes_icon():
    """Create the 'notes' app icon using matplotlib"""
    
    # Create figure with dark blue background
    fig = plt.figure(figsize=(10.24, 10.24), dpi=100)
    ax = fig.add_subplot(111)
    
    # Set dark blue background
    ax.set_facecolor('#2d4a5c')
    fig.patch.set_facecolor('#2d4a5c')
    
    # Remove axes
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.axis('off')
    
    # Add text "notes" with teal 'o'
    # White "n"
    ax.text(0.25, 0.5, 'n', fontsize=200, color='white', 
            ha='left', va='center', weight='bold', family='sans-serif')
    # Teal "o"
    ax.text(0.38, 0.5, 'o', fontsize=200, color='#33cccc', 
            ha='left', va='center', weight='bold', family='sans-serif')
    # White "tes"
    ax.text(0.51, 0.5, 'tes', fontsize=200, color='white', 
            ha='left', va='center', weight='bold', family='sans-serif')
    
    # Save the icon
    output_path = os.path.join(
        os.path.dirname(__file__),
        'HebrewAlias',
        'Resources',
        'Assets.xcassets',
        'AppIcon.appiconset',
        'icon-1024.png'
    )
    
    plt.tight_layout(pad=0)
    plt.savefig(output_path, dpi=100, bbox_inches='tight', 
                facecolor='#2d4a5c', edgecolor='none', pad_inches=0)
    print(f"✓ App icon created successfully at: {output_path}")
    print(f"  Design: 'notes' with teal 'o' on dark blue background")
    
    plt.close()

if __name__ == "__main__":
    create_notes_icon()
