import SwiftUI

struct GameplayView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State private var hasStarted = false
    @State private var showExitAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                // Exit button
                Button(action: {
                    showExitAlert = true
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red.opacity(0.7))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("סיבוב \(viewModel.currentRound) מתוך \(viewModel.settings.numberOfRounds)")
                        .font(.caption)
                        .opacity(0.7)
                    HStack(spacing: 8) {
                        Text(viewModel.getCurrentTeam().name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(viewModel.settings.difficulty.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(4)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text(viewModel.settings.unlimitedTimeMode ? "" : "זמן:")
                        .font(.caption)
                    if viewModel.settings.unlimitedTimeMode {
                        Text("אין הגבלת זמן")
                            .font(.headline)
                            .foregroundColor(.green)
                    } else {
                        HStack(spacing: 0) {
                            Text("\(viewModel.timeRemaining)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(viewModel.timeRemaining < 10 ? .red : .primary)
                            Text("ש")
                                .font(.caption)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Divider()
            
            if !hasStarted {
                // Waiting to start
                VStack(spacing: 20) {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("קבוצה: \(viewModel.getCurrentTeam().name)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("אתה מתאר מילים לקבוצתך, בלי להגיד את המילה עצמה!")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .opacity(0.8)
                        
                        if viewModel.settings.unlimitedTimeMode {
                            Text("תארו \(viewModel.settings.wordsPerTurnInUnlimitedMode) מילים - ללא הגבלת זמן!")
                                .font(.headline)
                                .foregroundColor(.green)
                        } else {
                            Text("יש לך \(viewModel.settings.timePerTurn) שניות")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    Button(action: {
                        hasStarted = true
                        viewModel.startTurn()
                    }) {
                        Text("התחל תור!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                }
            } else {
                // Game play
                GameplayCardView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .alert("לצאת מהמשחק?", isPresented: $showExitAlert) {
            Button("ביטול", role: .cancel) { }
            Button("יציאה", role: .destructive) {
                viewModel.restart()
            }
        } message: {
            Text("התקדמות המשחק לא תישמר")
        }
    }
}

struct GameplayCardView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Stats
            HStack {
                VStack(alignment: .leading) {
                    Text("ניחש:")
                        .font(.caption)
                        .opacity(0.7)
                    Text("\(viewModel.guessedThisRound)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("דילג:")
                        .font(.caption)
                        .opacity(0.7)
                    Text("\(viewModel.skippedThisRound)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Divider()
            
            // Word Card
            if let word = viewModel.getNextWord() {
                VStack(spacing: 30) {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        
                        VStack(spacing: 20) {
                            Text("המילה:")
                                .font(.headline)
                                .opacity(0.7)
                            
                            Text(word.text)
                                .font(.system(size: 48, weight: .bold))
                                .lineLimit(1)
                            
                            Text("קטגוריה: \(word.category)")
                                .font(.caption)
                                .opacity(0.6)
                        }
                        .padding(.vertical, 40)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Action Buttons
                    HStack(spacing: 15) {
                        Button(action: {
                            viewModel.markWordAsSkipped(word)
                        }) {
                            Text("דלג")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.red.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            viewModel.markWordAsGuessed(word)
                        }) {
                            Text("ניחשתי!")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            } else {
                VStack(spacing: 15) {
                    Spacer()
                    HStack(spacing: 12) {
                        ProgressView()
                            .tint(.blue)
                        Text("חכה למילה הבאה...")
                            .font(.headline)
                            .opacity(0.7)
                    }
                    Spacer()
                }
                .onAppear {
                    if !viewModel.isTimerRunning && viewModel.timeRemaining > 0 {
                        viewModel.startTurn()
                    }
                }
            }
        }
    }
}

#Preview {
    GameplayView()
        .environmentObject(GameViewModel())
        .environment(\.layoutDirection, .rightToLeft)
}
