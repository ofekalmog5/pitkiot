# Pitkiot - Development Guide

## Quick Start

### Requirements
- Mac with Xcode 14.0+
- iOS 16.0+ SDK
- Swift 5.9+

### Setup Instructions

1. **Open in Xcode**
   - Open `HebrewAlias` folder in Xcode
   - Xcode will automatically detect the Swift files

2. **Configure Signing**
   - Select project in Xcode
   - Go to Signing & Capabilities
   - Select your development team
   - Set bundle identifier to `com.hebrewalias.app`

3. **Run on Simulator**
   - Select iPhone 15 simulator
   - Press ⌘R to run
   - App should launch to menu screen

## Code Organization

### Models (HebrewAlias/Models/)

#### GameModels.swift
Contains core game data structures:
- `GameSettings` - Game configuration presets
- `Team` - Team data with colors
- `Word` - Word with category
- `Turn` - Single turn data
- `GamePhase` - Navigation states
- `RoundResult` - Round statistics
- `GameStatistics` - Final game stats

#### WordDatabase.swift
Word management system:
- Stores 100+ Hebrew words
- Organized by 8 categories
- Provides random word selection
- Supports adding custom words

### ViewModels (HebrewAlias/ViewModels/)

#### GameViewModel.swift
Central game logic controller (ObservableObject):
- Manages game phases
- Handles team creation
- Controls timer and turns
- Tracks scores
- Manages round/game state

Key methods:
- `createTeams(with:)` - Initialize teams
- `startGame()` - Begin gameplay
- `startTurn()` - Start team's turn
- `markWordAsGuessed(_:)` - Update score
- `markWordAsSkipped(_:)` - Skip word
- `endTurn()` - Complete turn
- `endGame()` - Finish game

### Views (HebrewAlias/Views/)

#### ContentView.swift
Main navigation container
- Routes between game phases
- Applies RTL layout direction
- Background gradient styling

#### MenuView.swift
Main menu screen
- Displays 4 game presets
- Allows preset selection
- Start button leads to team setup

#### TeamSetupView.swift
Team configuration screen
- Input fields for team names
- Color indicators
- Validates inputs before game start

#### GameplayView.swift
Main game screen
- Shows current turn info
- Timer display
- Word card presentation
- Guess/Skip buttons

#### RoundResultsView.swift
Between-round summary
- Displays current scores
- Shows team standings
- Navigation to next turn/round

#### GameResultsView.swift
Final results screen
- Announces winner
- Shows final scores
- Statistics display
- Restart button

## Game Flow

```
Menu
  ↓
Select Preset (GameSettings)
  ↓
Team Setup
  ↓
Gameplay Loop:
  ├─ For each round:
  │  ├─ For each team:
  │  │  ├─ Wait for start confirmation
  │  │  ├─ Display words (one at a time)
  │  │  ├─ Track guesses/skips
  │  │  ├─ Run 60-second timer
  │  │  └─ Record score
  │  └─ Show round results
  └─ Repeat for all rounds
  ↓
Final Results
  ↓
Menu (restart loop)
```

## Customization Guide

### Add More Words

Edit `WordDatabase.swift`:

```swift
private func loadWords() {
    allWords = [
        // Add new words following existing pattern:
        Word(text: "מילה", category: "קטגוריה"),
        // ...
    ]
}
```

### Add New Category

1. Add to `Word.Category` enum in `GameModels.swift`
2. Add category name in Hebrew and English
3. Add 10+ words in that category to `WordDatabase.swift`

### Modify Game Settings

Edit presets in `GameModels.swift`:

```swift
static let presets = [
    GameSettings(
        numberOfRounds: 3,
        timePerTurn: 60,
        numberOfTeams: 2,
        wordsPerRound: 10
    ),
    // Add more presets...
]
```

### Change UI Colors

Edit color values in Views:
- `.foregroundColor(.blue)` - Text color
- `.background(Color.green)` - Background
- `.fill(Color.red.opacity(0.7))` - Fills

### Modify Timer Duration

Change in `GameSettings`:
```swift
var timePerTurn: Int = 60  // in seconds
```

## RTL (Right-to-Left) Support

The app supports Hebrew RTL layout via:
```swift
.environment(\.layoutDirection, .rightToLeft)
```

All views automatically respect this environment setting.

## Testing Checklist

### Game Logic
- [ ] Teams initialize correctly with custom names
- [ ] Score increments on "guess"
- [ ] Score remains on "skip"
- [ ] Timer counts down accurately
- [ ] Timer stops at 0
- [ ] Words marked as guessed don't reappear
- [ ] Round transitions correctly
- [ ] Final results show correct winner
- [ ] Restart button returns to menu

### UI/UX
- [ ] All text displays in Hebrew
- [ ] RTL layout correct
- [ ] Buttons respond to taps
- [ ] Transitions are smooth
- [ ] Text doesn't overflow
- [ ] All screens visible on iPhone 12-15
- [ ] iPad landscape mode works
- [ ] Colors are visible and distinct

### Data
- [ ] Word database loads correctly
- [ ] All categories represented
- [ ] No duplicate words selected
- [ ] Scores persist through rounds
- [ ] Statistics calculated correctly

## Common Issues & Solutions

### Issue: Hebrew text appears backwards
**Solution**: Ensure `layoutDirection` environment modifier is applied

### Issue: Timer doesn't countdown
**Solution**: Check that `startTimer()` is called after `startTurn()`

### Issue: Words repeat
**Solution**: Verify word selection uses `shuffled()` and `prefix()`

### Issue: Scores not updating
**Solution**: Ensure `@Published` properties trigger view updates

## Performance Optimization

### Current Optimizations
- Lazy word loading (loaded on app start)
- Efficient word shuffling
- Minimal state redraws
- No heavy computations on main thread

### Future Improvements
- Word database async loading
- Image/emoji support for words
- Sound effects async loading
- Background music control

## Publishing to App Store

### Pre-Submission
1. Increase version number to 1.0.0
2. Add app icons (1024x1024)
3. Create App Store screenshots
4. Write app description and keywords
5. Set age rating
6. Add privacy policy link

### Submission Process
1. Create App Store Connect app record
2. Add metadata and screenshots
3. Set pricing (free or paid)
4. Configure capabilities
5. Build and archive in Xcode
6. Upload via TestFlight
7. Test on devices
8. Submit for review

### App Store Review Guidelines
- [ ] App complies with App Store guidelines
- [ ] No inappropriate content
- [ ] Works as described
- [ ] Proper Hebrew localization
- [ ] No crashes or bugs
- [ ] Appropriate age rating
- [ ] Privacy policy provided

## Support & Maintenance

### Reporting Bugs
Document with:
- iOS version
- Device model
- Reproduction steps
- Expected vs actual behavior
- Screenshots/videos if applicable

### Feature Requests
Include:
- Feature description
- Use case
- Benefit to users
- Estimated complexity

### Performance Monitoring
- Monitor memory usage
- Track crash reports
- Monitor battery drain
- Test on various devices

---

**Last Updated**: 2026-02-13
**Version**: 1.0.0
**Language**: Swift 5.9+
**Target**: iOS 16.0+
