import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            // Board Game Background - Paper with grid
            ZStack {
                Color(red: 0.95, green: 0.88, blue: 0.75)
                    .ignoresSafeArea()
                
                // Grid pattern overlay
                VStack(spacing: 40) {
                    ForEach(0..<20, id: \.self) { _ in
                        HStack(spacing: 40) {
                            ForEach(0..<10, id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    .frame(height: 30)
                            }
                        }
                    }
                }
                .padding(20)
                
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
