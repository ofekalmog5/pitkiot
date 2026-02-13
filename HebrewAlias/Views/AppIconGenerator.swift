import SwiftUI

// This view generates the app icon design
// To use: Run the app, navigate to this view, take a screenshot, and crop to 1024x1024px
// Then save as icon-1024.png in Resources/Assets.xcassets/AppIcon.appiconset/

struct AppIconGenerator: View {
    var body: some View {
        ZStack {
            // Background - warm paper color
            LinearGradient(
                colors: [Color(red: 1.0, green: 0.95, blue: 0.85), 
                        Color(red: 0.95, green: 0.88, blue: 0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // Multiple paper notes stacked
            VStack(spacing: -20) {
                // Top note (slightly rotated)
                NoteCard(
                    text: "פ",
                    rotation: -8,
                    color: Color(red: 1.0, green: 0.95, blue: 0.6)
                )
                .offset(x: -15, y: 10)
                
                // Middle note
                NoteCard(
                    text: "פיתקיות",
                    rotation: 3,
                    color: Color(red: 0.6, green: 0.85, blue: 1.0),
                    fontSize: 32
                )
                .offset(x: 10, y: 0)
                
                // Bottom note (slightly rotated)
                NoteCard(
                    text: "🎯",
                    rotation: -5,
                    color: Color(red: 1.0, green: 0.8, blue: 0.85)
                )
                .offset(x: -5, y: -10)
            }
        }
        .frame(width: 1024, height: 1024)
        .clipShape(RoundedRectangle(cornerRadius: 226)) // iOS app icon corner radius
    }
}

struct NoteCard: View {
    let text: String
    let rotation: Double
    let color: Color
    var fontSize: CGFloat = 80
    
    var body: some View {
        ZStack {
            // Paper shadow
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.2))
                .frame(width: 200, height: 200)
                .offset(y: 8)
            
            // Main paper note
            RoundedRectangle(cornerRadius: 12)
                .fill(color)
                .frame(width: 200, height: 200)
                .overlay(
                    // Paper texture lines
                    VStack(spacing: 25) {
                        ForEach(0..<3) { _ in
                            Rectangle()
                                .fill(Color.black.opacity(0.05))
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal, 20)
                )
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
            
            // Text on note
            Text(text)
                .font(.system(size: fontSize, weight: .bold))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
        }
        .rotationEffect(.degrees(rotation))
    }
}

// Preview for testing
#Preview {
    VStack {
        AppIconGenerator()
            .frame(width: 512, height: 512) // Scaled down for preview
        
        Text("Screenshot this at 1024x1024 for app icon")
            .font(.caption)
            .padding()
    }
}
