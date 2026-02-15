import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            // Board Game Background - Paper with grid
            ZStack {
                Color(red: 0.95, green: 0.88, blue: 0.75)
                    .ignoresSafeArea()
                
                // Simpler grid pattern overlay using Canvas
                Canvas { context, size in
                    let gridSize: CGFloat = 50
                    
                    // Vertical lines
                    for x in stride(from: 0, through: size.width, by: gridSize) {
                        var path = Path()
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: size.height))
                        context.stroke(path, with: .color(Color.white.opacity(0.2)), lineWidth: 0.5)
                    }
                    
                    // Horizontal lines
                    for y in stride(from: 0, through: size.height, by: gridSize) {
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: size.width, y: y))
                        context.stroke(path, with: .color(Color.white.opacity(0.2)), lineWidth: 0.5)
                    }
                }
                .ignoresSafeArea()
                
                // Texture overlay
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(0.02),
                        Color.black.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            }
            
            // Navigation
            Group {
                switch viewModel.gamePhase {
                case .menu:
                    MenuView()
                case .teamSetup:
                    TeamSetupView()
                case .gamePlay, .timeUpChallenge:
                    GameplayView()
                case .roundResults:
                    RoundResultsView()
                case .gameResults:
                    GameResultsView()
                }
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    ContentView()
        .environmentObject(GameViewModel())
}
