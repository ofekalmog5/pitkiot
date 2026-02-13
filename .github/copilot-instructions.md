# HebrewAlias - iOS Alias Game

Hebrew-language word guessing game for iOS/App Store built with Swift and SwiftUI.

## Project Setup
- Swift 5.9+
- iOS 16.0+ target
- SwiftUI framework
- MVVM architecture

## Folder Structure
- `HebrewAlias/` - Main app source code
- `Views/` - SwiftUI view components
- `Models/` - Data structures
- `ViewModels/` - Business logic
- `Resources/` - Assets and localization

## Progress
- [x] Project requirements verified
- [x] Project structure created
- [x] Core game logic implemented
- [x] UI screens built (5 main views + navigation)
- [x] Hebrew word database added (100+ words, 8 categories)
- [x] Documentation complete

## Completed Components

### Models & Data
- GameModels.swift: Game structures (Team, Word, Turn, GameSettings)
- WordDatabase.swift: 100+ Hebrew words across 8 categories
- Full MVVM architecture

### Views (SwiftUI)
- ContentView.swift: Main navigation container
- MenuView.swift: Game preset selection
- TeamSetupView.swift: Team name input
- GameplayView.swift: Main game screen
- RoundResultsView.swift: Score display between rounds
- GameResultsView.swift: Final results and winner

### ViewModel
- GameViewModel.swift: Complete game logic, state management, timer control

### Documentation
- README.md: Project overview and features
- APP_STORE_CONFIG.md: Metadata for App Store submission
- DEVELOPMENT.md: Developer guide and customization
- BUILD_AND_TEST.md: Build instructions and testing guide

## App Features
- ✅ 2-4 player support with teams
- ✅ Customizable game presets
- ✅ Turn-based gameplay with 60-second timer
- ✅ Score tracking and statistics
- ✅ Full Hebrew localization (RTL support)
- ✅ Clean SwiftUI UI with smooth animations
- ✅ Word categories: Animals, Food, Sports, Movies, Technology, Nature, Professions, Countries

## To Build & Run
1. Open HebrewAlias folder in Xcode 14+
2. Select iPhone simulator
3. Press ⌘R to run
4. See README.md and DEVELOPMENT.md for detailed instructions
