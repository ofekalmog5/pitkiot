import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
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
