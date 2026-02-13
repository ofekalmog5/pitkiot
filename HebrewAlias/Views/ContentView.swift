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
                Canvas { context in
                    let gridSize: CGFloat = 50
                    let width = UIScreen.main.bounds.width
                    let height = UIScreen.main.bounds.height
                    
                    // Vertical lines
                    for x in stride(from: 0, through: width, by: gridSize) {
                        var path = Path()
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: height))
                        context.stroke(path, with: .color(Color.white.opacity(0.2)), lineWidth: 0.5)
                    }
                    
                    // Horizontal lines
                    for y in stride(from: 0, through: height, by: gridSize) {
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: width, y: y))
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
                case .gamePlay:
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
