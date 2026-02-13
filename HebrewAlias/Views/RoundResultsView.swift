import SwiftUI

struct RoundResultsView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("סיום תור")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Current Scores
            VStack(spacing: 10) {
                Text("ניקוד עכשיו:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                ForEach(viewModel.teams.indices, id: \.self) { index in
                    HStack {
                        Text(viewModel.teams[index].name)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(viewModel.teams[index].score)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            // Continue Button
            Button(action: {
                if viewModel.currentTeamIndex < viewModel.settings.numberOfTeams {
                    viewModel.gamePhase = .gamePlay
                } else {
                    viewModel.endTurn()
                }
            }) {
                Text("המשך")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    RoundResultsView()
        .environmentObject(GameViewModel())
        .environment(\.layoutDirection, .rightToLeft)
}
