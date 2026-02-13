import SwiftUI

struct GameResultsView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Winner
            if let results = viewModel.gameResults {
                VStack(spacing: 20) {
                    Text("🎉")
                        .font(.system(size: 60))
                    
                    VStack(spacing: 10) {
                        Text("המנצח:")
                            .font(.headline)
                            .opacity(0.8)
                        
                        Text(results.winningTeam.name)
                            .font(.system(size: 36, weight: .bold))
                    }
                    
                    // Final Scores
                    VStack(spacing: 12) {
                        Text("תוצאות סופיות:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        ForEach(viewModel.teams.indices, id: \.self) { index in
                            HStack {
                                Text(viewModel.teams[index].name)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("\(viewModel.teams[index].score)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Statistics
                    VStack(spacing: 10) {
                        StatRow(label: "סה\"כ מילים:", value: "\(results.totalGuessedWords)")
                        StatRow(label: "ממוצע למילה:", value: String(format: "%.2f", results.averageTimePerWord))
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            // Restart Button
            Button(action: {
                viewModel.restart()
            }) {
                Text("משחק חדש")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct StatRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .opacity(0.7)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
}

#Preview {
    GameResultsView()
        .environmentObject(GameViewModel())
        .environment(\.layoutDirection, .rightToLeft)
}
