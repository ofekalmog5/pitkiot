# App Icon Setup Guide

## Overview
The app icon has been configured with a notes/paper theme to match the "Pitkiot" game concept.

## Quick Start

### Option 1: Generate from SwiftUI View (Recommended)
1. Build and run the app in simulator or device
2. Navigate to the `AppIconGenerator` view (you can add a temporary button in MenuView to access it)
3. Take a screenshot when viewing the icon at full size
4. Crop/save the screenshot as **1024x1024px** PNG
5. Name it `icon-1024.png`
6. Save it to: `HebrewAlias/Resources/Assets.xcassets/AppIcon.appiconset/`
7. Rebuild the project

### Option 2: Use Design Software
Create a 1024x1024px icon with the following design:
- **Background**: Warm paper texture gradient (cream/beige)
- **Elements**: 3 overlapping paper notes with slight rotation
  - Top note: Yellow sticky note with Hebrew letter "פ"
  - Middle note: Blue paper with "פיתקיות" text
  - Bottom note: Pink/rose paper with game icon (🎯)
- **Style**: Soft shadows, rounded corners, playful rotation angles
- **Colors**:
  - Yellows: #FFFF99
  - Blues: #99D9FF
  - Pinks: #FFD6E0
  - Background: #FFF2D9 to #F2E0BF gradient

## Files Created
- `HebrewAlias/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json`
- `HebrewAlias/Resources/Assets.xcassets/Contents.json`
- `HebrewAlias/Views/AppIconGenerator.swift`

## What's Configured
✅ Assets catalog added to project
✅ AppIcon configuration (iOS requires 1024x1024)
✅ SwiftUI icon generator view
✅ Xcode project file updated with new resources

## Next Steps
1. Generate or create the `icon-1024.png` file (1024x1024px)
2. Add it to `AppIcon.appiconset` folder
3. Commit and push changes
4. GitHub Actions will automatically build with the new icon

## Using AppIconGenerator View Temporarily
Add this button to MenuView for testing:

```swift
// In MenuView body, add somewhere:
Button("Generate Icon") {
    // Show icon generator
}
.sheet(isPresented: $showIconGenerator) {
    AppIconGenerator()
}
```

Then screenshot the icon renderer at 1024x1024 resolution.

## Icon Design Theme
The icon represents the physical "Pitkiot" (paper notes) used in the Hebrew word game, with multiple colorful notes stacked and rotated to create a playful, inviting appearance that matches the game's casual, fun nature.
