# Pitkiot - Project Configuration

## App Store Metadata

### App Information
- **App Name**: פיתקיות - משחק תיאור מילים (Pitkiot - Hebrew Word Description Game)
- **Bundle Identifier**: com.pitkiot.app
- **Version**: 1.0.0
- **Minimum iOS**: 16.0
- **Supported Devices**: iPhone, iPad

### Category
Games > Party Games

### Description for App Store

#### English
Pitkiot is a fast-paced word description party game for iOS. Describe words to your teammates without saying the word itself - race against the clock to guess as many words as possible! Perfect for parties, gatherings, and team building.

Features:
- Multiplayer gameplay (2-4 teams)
- Fully in Hebrew
- Customizable game settings
- 100+ words across 8 categories
- Real-time scoring
- Perfect for parties

#### Hebrew
פיתקיות היא משחק תיאור מילים מהיר וכיף לבקרים וכנסים. תאר מילים לקבוצתך בלי להגיד את המילה עצמה - התחרה בזמן כדי לנחש כמה שיותר מילים! מושלם לבקרים, כנסים וטימ בילדינג.

תכונות:
- משחק רבקבוצתי (2-4 קבוצות)
- ממוחשב בעברית
- הגדרות משחק גמישות
- יותר מ-100 מילים ב-8 קטגוריות
- ניקוד בזמן אמת
- מושלם לבקרים וכנסים

### Keywords
פיתקיות, משחק מילים, משחק תיאור, משחק קבוצתי, משחק עברי, party game, word game

### Gameplay Settings

#### Default Presets
1. **Quick Game**: 1 round, 60 seconds per turn, 2 teams, 5 words
2. **Standard**: 3 rounds, 60 seconds per turn, 2 teams, 10 words
3. **Tournament**: 3 rounds, 90 seconds per turn, 3 teams, 10 words
4. **Extended**: 5 rounds, 60 seconds per turn, 4 teams, 15 words

### Word Categories
1. **בעלי חיים** (Animals) - 10 words
2. **אוכל** (Food) - 10 words
3. **ספורט** (Sports) - 10 words
4. **סרטים** (Movies) - 10 words
5. **טכנולוגיה** (Technology) - 10 words
6. **טבע** (Nature) - 10 words
7. **מקצועות** (Professions) - 10 words
8. **מדינות** (Countries) - 10 words

### Team Colors
- Red (אדום)
- Blue (כחול)
- Green (ירוק)
- Yellow (צהוב)

## Development Notes

### Architecture
- **Pattern**: MVVM (Model-View-ViewModel)
- **Framework**: SwiftUI
- **Language**: Swift 5.9+
- **Target**: iOS 16.0+

### File Organization
```
HebrewAlias/
├── Models/
│   ├── GameModels.swift (Game structures and enums)
│   └── WordDatabase.swift (Word data and management)
├── ViewModels/
│   └── GameViewModel.swift (Game state and logic)
├── Views/
│   ├── ContentView.swift (Main navigation)
│   ├── MenuView.swift (Main menu and settings)
│   ├── TeamSetupView.swift (Team name input)
│   ├── GameplayView.swift (Game play screen)
│   ├── RoundResultsView.swift (Round score display)
│   └── GameResultsView.swift (Final results)
└── HebrewAliasApp.swift (App entry point)
```

### Key Features Implemented
1. ✅ Multiplayer support (2-4 teams)
2. ✅ Customizable game presets
3. ✅ Turn-based gameplay
4. ✅ Timer system
5. ✅ Score tracking
6. ✅ Hebrew localization
7. ✅ RTL support
8. ✅ Results and statistics

### Future Enhancement Ideas
- [ ] Sound effects
- [ ] Custom word lists
- [ ] Player profiles
- [ ] Online multiplayer
- [ ] Achievement system
- [ ] Leaderboard
- [ ] More word categories
- [ ] Difficulty levels
- [ ] Settings (music, sound)
- [ ] Pause/resume functionality

## Building for App Store

### Steps
1. Create Apple Developer account
2. Configure signing and provisioning profiles
3. Set up App Store Connect
4. Create app record with metadata
5. Upload build via Xcode Organizer
6. Add screenshots and preview videos
7. Submit for review

### Required Assets
- App Icon (1024x1024)
- Screenshots (iPhone/iPad)
- App Preview Video (optional)
- Privacy Policy
- Terms & Conditions

### Testing Checklist
- [ ] Test all game modes
- [ ] Test team rotation
- [ ] Test timer accuracy
- [ ] Test scoring calculations
- [ ] Test RTL Hebrew text
- [ ] Test on different device sizes
- [ ] Performance testing
- [ ] Memory usage testing
