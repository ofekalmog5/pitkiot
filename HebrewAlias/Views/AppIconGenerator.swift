import SwiftUI

// This view generates the app icon design
// To use: Run the app, navigate to this view, take a screenshot, and crop to 1024x1024px
// Then save as icon-1024.png in Resources/Assets.xcassets/AppIcon.appiconset/

struct AppIconGenerator: View {
    var body: some View {
        ZStack {
            // Background - warm yellow/cream
            LinearGradient(
                colors: [Color(red: 1.0, green: 0.95, blue: 0.7), 
                        Color(red: 1.0, green: 0.92, blue: 0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 0) {
                // Top section - notepad spiral
                HStack(spacing: 0) {
                    // Spiral binding (3 circles)
                    VStack(spacing: 25) {
                        Circle()
                            .fill(Color(red: 0.3, green: 0.3, blue: 0.4))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color(red: 0.3, green: 0.3, blue: 0.4))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color(red: 0.3, green: 0.3, blue: 0.4))
                            .frame(width: 20, height: 20)
                    }
                    .padding(.leading, 40)
                    .padding(.top, 50)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 200)
                
                // Main notepad section
                ZStack {
                    // White paper background
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white)
                    
                    VStack(spacing: 0) {
                        // Ruled lines for writing
                        VStack(spacing: 35) {
                            ForEach(0..<5) { _ in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 0.8, green: 0.9, blue: 1.0))
                                        .frame(height: 2)
                                }
                            }
                        }
                        .padding(.horizontal, 50)
                        .padding(.vertical, 40)
                        
                        Spacer()
                    }
                    
                    // Pen/pencil icon on the right
                    VStack(alignment: .trailing) {
                        HStack(spacing: 0) {
                            Spacer()
                            
                            // Pencil design
                            ZStack {
                                // Pencil wood (brown/tan)
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(red: 0.85, green: 0.75, blue: 0.5))
                                    .frame(width: 16, height: 100)
                                
                                // Pencil lead (dark)
                                Rectangle()
                                    .fill(Color(red: 0.3, green: 0.3, blue: 0.3))
                                    .frame(width: 4, height: 100)
                                
                                // Pencil tip (sharp triangle)
                                ZStack {
                                    Polygon(sides: 3)
                                        .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                                        .frame(width: 16, height: 12)
                                }
                                .offset(y: 50)
                            }
                            .rotationEffect(.degrees(-45))
                            .offset(x: 20, y: -30)
                        }
                        
                        Spacer()
                    }
                    .padding(.trailing, 40)
                    .padding(.top, 40)
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 40)
                .padding(.vertical, 50)
            }
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
