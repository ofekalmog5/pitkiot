import SwiftUI

// This view generates the app icon design - "notes" theme
// To use: Run the app, navigate to this view, take a screenshot, and crop to 1024x1024px
// Then save as icon-1024.png in Resources/Assets.xcassets/AppIcon.appiconset/

struct AppIconGenerator: View {
    var body: some View {
        ZStack {
            // Background - dark blue
            Color(red: 0.13, green: 0.25, blue: 0.35)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Main text and circle
                HStack(spacing: 0) {
                    // White text "notes"
                    Text("notes")
                        .font(.system(size: 140, weight: .bold, design: .default))
                        .tracking(8)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Teal/Turquoise circle overlay (positioned over the 'o' in notes)
            Circle()
                .stroke(Color(red: 0.2, green: 0.8, blue: 0.8), lineWidth: 35)
                .frame(width: 240, height: 240)
                .offset(x: -80, y: 0)
        }
        .frame(width: 1024, height: 1024)
        .clipShape(RoundedRectangle(cornerRadius: 226)) // iOS app icon corner radius
    }
}

// Simple polygon shape for pencil tip
struct Polygon: Shape {
    let sides: Int
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        
        for i in 0..<sides {
            let angle = Double(i) * 2 * .pi / Double(sides) - .pi / 2
            let x = center.x + rect.width / 2 * cos(angle)
            let y = center.y + rect.height / 2 * sin(angle)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
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
