import SwiftUI

struct MenuView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State private var selectedSettingIndex = 1
    @State private var showCustomSettings = false
    @State private var customRounds: Int = 3
    @State private var selectedDifficulty: DifficultyLevel = .medium
    @State private var showIconGenerator = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Title
            VStack(spacing: 10) {
                Text("פיתקיות")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                
                Text("משחק תיאור מילים")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.top, 40)
            
            Spacer()
            
            if !showCustomSettings {
                // Game Settings Selection
                VStack(spacing: 15) {
                    Text("בחר הגדרת משחק")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ForEach(GameSettings.presets.indices, id: \.self) { index in
                        let preset = GameSettings.presets[index]
                        SettingPresetButton(
                            preset: preset,
                            isSelected: selectedSettingIndex == index,
                            action: {
                                selectedSettingIndex = index
                                viewModel.settings = preset
                                selectedDifficulty = preset.difficulty
                                customRounds = preset.numberOfRounds
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Custom Settings Button
                Button(action: { showCustomSettings = true }) {
                    Text("הגדרות מותאמות אישית")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                Button(action: { showIconGenerator = true }) {
                    Text("יצירת אייקון אפליקציה")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.15))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Start Button
                Button(action: {
                    viewModel.gamePhase = .teamSetup
                }) {
                    Text("התחל משחק")
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
            } else {
                // Custom Settings Screen
                CustomSettingsView(
                    rounds: $customRounds,
                    difficulty: $selectedDifficulty,
                    settings: $viewModel.settings,
                    showCustomSettings: $showCustomSettings
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showIconGenerator) {
            AppIconGenerator()
        }
    }
}

struct CustomSettingsView: View {
    @Binding var rounds: Int
    @Binding var difficulty: DifficultyLevel
    @Binding var settings: GameSettings
    @Binding var showCustomSettings: Bool
    @State private var unlimitedTimeMode: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Back Button
            HStack {
                Button(action: { showCustomSettings = false }) {
                    HStack {
                        Image(systemName: "chevron.right")
                        Text("חזור")
                    }
                    .foregroundColor(.blue)
                }
                Spacer()
                Text("הגדרות מותאמות")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            Divider()
                .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 25) {
                    // Rounds Selector
                    VStack(alignment: .leading, spacing: 10) {
                        Text("מספר סיבובים: \(rounds)")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Slider(value: Binding(
                            get: { Double(rounds) },
                            set: { rounds = Int($0) }
                        ), in: 1...10, step: 1)
                            .tint(.blue)
                        
                        HStack {
                            Text("1").font(.caption)
                            Spacer()
                            Text("10").font(.caption)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    // Difficulty Selector
                    VStack(alignment: .leading, spacing: 12) {
                        Text("רמת קושי")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(DifficultyLevel.allCases, id: \.self) { level in
                            HStack {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(level.rawValue)
                                        .fontWeight(.semibold)
                                    Text(level.description)
                                        .font(.caption)
                                        .opacity(0.7)
                                }
                                Spacer()
                                if difficulty == level {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(difficulty == level ? Color.blue.opacity(0.2) : Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .onTapGesture {
                                difficulty = level
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    // Unlimited Time Mode Toggle
                    VStack(alignment: .leading, spacing: 10) {
                        Toggle(isOn: $unlimitedTimeMode) {
                            VStack(alignment: .leading, spacing: 3) {
                                Text("משחק ללא הגבלת זמן")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text(unlimitedTimeMode ? "5 מילים בכל תור" : "משחק עם טיימר")
                                    .font(.caption)
                                    .opacity(0.7)
                            }
                        }
                        .tint(.blue)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, 20)
            }
            
            Spacer()
            
            // Apply Button
            Button(action: {
                settings.numberOfRounds = rounds
                settings.difficulty = difficulty
                settings.unlimitedTimeMode = unlimitedTimeMode
                showCustomSettings = false
            }) {
                Text("החל הגדרות")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .onAppear {
            unlimitedTimeMode = settings.unlimitedTimeMode
        }
    }
}

struct SettingPresetButton: View {
    let preset: GameSettings
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(preset.numberOfTeams) קבוצות • \(preset.numberOfRounds) סיבובים")
                        .fontWeight(.semibold)
                    HStack(spacing: 10) {
                        Text("\(preset.timePerTurn) שניות")
                            .font(.caption)
                        Text(preset.difficulty.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(4)
                    }
                    .opacity(0.8)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 12)
            .background(isSelected ? Color.blue.opacity(0.3) : Color.white.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
        .foregroundColor(.primary)
    }
}

#Preview {
    MenuView()
        .environmentObject(GameViewModel())
        .environment(\.layoutDirection, .rightToLeft)
}
