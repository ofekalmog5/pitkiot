# Pitkiot - Hebrew Word Description Game

An iOS implementation of a word description game, fully localized in Hebrew.

## About the Game

Pitkiot (פיתקיות) is a fast-paced word description game perfect for parties and gatherings. Players describe words to their teammates without saying the word itself, racing against the clock to guess as many words as possible.

## Features

- **Multiplayer Gameplay**: Support for 2-4 teams
- **Customizable Rounds**: Set number of rounds and time per turn
- **Rich Word Database**: 1000+ Hebrew words across various categories
- **Score Tracking**: Real-time score updates and leaderboard
- **Sound Effects**: Engaging audio feedback (optional)
- **Fully Localized**: Complete Hebrew UI and content

## Game Rules

1. Divide players into teams (2-4 teams recommended)
2. One player from each team takes a turn describing words
3. Describe the word any way you want - use synonyms, examples, gestures - just don't say the word itself!
4. Team guesses as many words as possible in 60 seconds
5. Each correct guess earns 1 point
6. After each round, scores accumulate
7. Team with highest score wins!

## Technical Requirements

- iOS 16.0 or later
- iPhone/iPad compatibility
- Supports both portrait and landscape orientations

## Installation

Build from source:
1. Open `HebrewAlias.xcodeproj` in Xcode
2. Select target device/simulator
3. Build and run (⌘R)

## File Structure

```
HebrewAlias/
├── Models/
│   ├── GameModels.swift
│   ├── Team.swift
│   └── Word.swift
├── ViewModels/
│   └── GameViewModel.swift
├── Views/
│   ├── ContentView.swift
│   ├── MenuView.swift
│   ├── TeamSetupView.swift
│   ├── GameplayView.swift
│   └── ResultsView.swift
├── Resources/
│   ├── HebrewWords.json
│   └── Assets.xcassets
└── HebrewAliasApp.swift
```

## Development

This project follows MVVM architecture:
- **Views**: UI components using SwiftUI
- **ViewModels**: Game state and business logic
- **Models**: Data structures and game rules

## License

Private - App Store Distribution

## Support

For bugs and feature requests, please contact the development team.
