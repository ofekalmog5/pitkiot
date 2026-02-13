# HebrewAlias - Build & Test Guide

## Building the App

### Prerequisites
- Mac with macOS 12.0 or later
- Xcode 14.0 or later
- iOS 16.0 SDK or later
- Apple Developer Account (for App Store release)

### Build Steps

#### Development Build
1. Open the project in Xcode
2. Select target device or simulator
3. Press ⌘B to build
4. Press ⌘R to run

#### Release Build (for App Store)
1. Select "Any iOS Device (arm64)" as destination
2. Go to Product → Archive
3. Choose team in signing dialog
4. Archive will appear in Organizer
5. Click "Validate App" to verify
6. Click "Distribute App" to submit

### Xcode Configuration

#### Project Settings
- **Product Name**: HebrewAlias
- **Bundle ID**: com.hebrewalias.app
- **Version**: 1.0.0
- **Build**: 1
- **Minimum OS**: 16.0

#### Signing
1. Select "HebrewAlias" in Project Navigator
2. Go to Signing & Capabilities
3. Select your development team
4. Xcode auto-manages provisioning profiles

## Testing

### Unit Testing

Run tests:
```
⌘U in Xcode
```

### Manual Testing Scenarios

#### Scenario 1: Game Setup
1. Launch app
2. See menu with 4 preset options
3. Select second preset (Standard: 3 rounds)
4. Tap "Start Game"
5. Enter team names
6. Tap "Start Game!"
✓ Should navigate to gameplay

#### Scenario 2: Single Round
1. From team setup, start game
2. Team 1 name displays at top
3. Tap "Start Turn!"
4. Word card appears
5. Tap "Guess!" - counter increases
6. Tap "Skip" - word changes
7. Tap "Guess!" for more words
8. When time ends, round results show
✓ Scores should update correctly

#### Scenario 3: Multiple Rounds
1. Complete at least one team's turn
2. Tap "Continue" through all teams
3. Verify each team gets a turn
4. Check scores accumulate
5. Verify new words each round
✓ All teams should get equal turns

#### Scenario 4: Game Completion
1. Play through all preset rounds
2. Verify final results screen
3. Confirm winning team displays
4. Check final scores correct
5. Tap "New Game" to restart
✓ Should return to menu

### Device Testing

Test on multiple devices:
- iPhone 12
- iPhone 13
- iPhone 14
- iPhone 15
- iPhone 15 Pro
- iPad (10th gen)
- iPad Pro

### Orientation Testing

Test in both:
- Portrait orientation
- Landscape orientation

Verify:
- All UI elements visible
- Text readable
- Buttons accessible
- No layout issues

### Accessibility Testing

Verify:
- [ ] Text sizes appropriate
- [ ] Color contrast sufficient
- [ ] Touch targets > 44pt
- [ ] VoiceOver compatible (if implemented)
- [ ] Text scaling works

### Performance Testing

Use Xcode Instruments:

1. **Memory Usage**
   - Open Instruments
   - Select Memory profiler
   - Play through game
   - Check for memory leaks
   - Monitor peak memory usage

2. **CPU Usage**
   - Monitor CPU during gameplay
   - Check timer accuracy
   - Verify no excessive CPU usage

3. **Battery Drain**
   - Run for 15+ minutes
   - Monitor battery drain
   - Verify reasonable power usage

### Localization Testing

Verify Hebrew text displays:
- [ ] All menu items in Hebrew
- [ ] All buttons in Hebrew
- [ ] All team names input in Hebrew
- [ ] All word categories in Hebrew
- [ ] RTL layout correct throughout
- [ ] Numbers display correctly

### Edge Cases

#### Test Cases
1. **Team Names**
   - Empty names
   - Very long names (20+ chars)
   - Special characters
   - Numbers only
   - Mixed Hebrew/English

2. **Numbers**
   - Zero teams (should not allow)
   - Teams: 2, 3, 4 (verify all work)
   - Time values: 30, 60, 90 seconds
   - Rounds: 1, 3, 5

3. **Gameplay**
   - All words guessed before time ends
   - No words guessed in entire round
   - All words skipped
   - Timer runs exactly to zero

### Bug Tracking

When testing, report bugs with:
1. Device model and iOS version
2. Step-by-step reproduction
3. Expected behavior
4. Actual behavior
5. Screenshot/video if applicable
6. Console output (if crash)

## Continuous Integration Setup

### GitHub Actions (Optional)

Create `.github/workflows/build.yml`:

```yaml
name: Build
on: [push, pull_request]
jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build
        run: xcodebuild build
```

### Pre-commit Checks
- [ ] Swift format (swiftformat)
- [ ] Lint (swiftlint)
- [ ] Build verification
- [ ] Unit tests pass

## App Store Submission Checklist

### Before Submission
- [ ] All features working
- [ ] No crashes on test devices
- [ ] All text in Hebrew
- [ ] App icons provided (1024×1024)
- [ ] Screenshots created (5 per orientation)
- [ ] Description written in Hebrew & English
- [ ] Keywords set (Hebrew + English)
- [ ] Privacy policy link provided
- [ ] Age rating set (4+)
- [ ] Support URL provided
- [ ] Version number correct (1.0.0)

### During Submission
- [ ] Build archived and validated
- [ ] No signing errors
- [ ] Appropriate bundle ID
- [ ] Supported devices set
- [ ] Minimum OS set to 16.0

### Post-Submission
- [ ] Monitor TestFlight feedback
- [ ] Address crashes
- [ ] Fix reported bugs
- [ ] Prepare for App Store review
- [ ] Monitor App Store review status

## Version Management

### Versioning Scheme
- **Major.Minor.Patch** (e.g., 1.0.0)
- Increment Major for significant features/overhauls
- Increment Minor for new features
- Increment Patch for bug fixes

### Release History
- **1.0.0** (2026-02) - Initial release
  - Core gameplay
  - 100+ Hebrew words
  - 2-4 player support
  - Full Hebrew localization

## Troubleshooting

### Build Fails
**Issue**: "Build failed" with no clear error
**Solution**: 
1. Clean build folder (⇧⌘K)
2. Delete derived data: `rm -rf ~/Library/Developer/Xcode/DerivedData`
3. Rebuild (⌘B)

### Simulator Issues
**Issue**: Simulator won't launch
**Solution**:
1. Quit Xcode and simulator
2. Delete simulator data: Device → Erase All Content
3. Restart Xcode
4. Rerun

### Signing Issues
**Issue**: "Signing for device requires development team"
**Solution**:
1. Select project
2. Go to Signing & Capabilities
3. Select your Apple Developer Team
4. Ensure bundle ID unique to your team

## Performance Targets

- **Launch Time**: < 2 seconds
- **Memory Usage**: < 100 MB
- **Timer Accuracy**: ±0.1 seconds
- **Frame Rate**: 60 FPS (smooth animations)
- **CPU Usage**: < 30% during gameplay

---

**Last Updated**: 2026-02-13
**Xcode Version**: 14.0+
**iOS Target**: 16.0+
