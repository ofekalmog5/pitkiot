import SwiftUI

struct TeamSetupView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State private var teamNames: [String] = ["קבוצה 1", "קבוצה 2"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Button(action: {
                    viewModel.gamePhase = .menu
                }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Text("הגדר קבוצות")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.clear)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Spacer()
            
            // Team Inputs
            VStack(spacing: 15) {
                Text("הכנס את שם כל קבוצה")
                    .font(.headline)
                
                ForEach(0..<viewModel.settings.numberOfTeams, id: \.self) { index in
                    HStack {
                        TextField("שם קבוצה", text: Binding(
                            get: { teamNames[safe: index] ?? "קבוצה \(index + 1)" },
                            set: { newValue in
                                if index < teamNames.count {
                                    teamNames[index] = newValue
                                }
                            }
                        ))
                            .textFieldStyle(.roundedBorder)
                            .font(.headline)
                        
                        // Color indicator
                        Circle()
                            .fill(Color(Team.TeamColor.allCases[index].colorValue))
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            // Start Button
            Button(action: {
                let names = teamNames.prefix(viewModel.settings.numberOfTeams).map { $0.isEmpty ? "קבוצה" : $0 }
                viewModel.createTeams(with: Array(names))
                
                // Ensure state updateby dispatching to main thread
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    viewModel.startGame()
                }
            }) {
                Text("התחל משחק!")
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
        .onAppear {
            // Initialize team names array
            teamNames = Array(repeating: "", count: viewModel.settings.numberOfTeams)
            for i in 0..<viewModel.settings.numberOfTeams {
                teamNames[i] = "קבוצה \(i + 1)"
            }
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        get {
            indices.contains(index) ? self[index] : nil
        }
        set {
            if let newValue = newValue, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}

#Preview {
    TeamSetupView()
        .environmentObject(GameViewModel())
        .environment(\.layoutDirection, .rightToLeft)
}
