# GitHub Actions Quick Reference

## 🚀 Getting Started (5 Minutes)

### 1. Create GitHub Repo
```powershell
# On Windows PowerShell
cd "c:\Users\ofeka\OneDrive\Desktop\school\presonal projects\HebrewAlias"

# Initialize git
git init
git add .
git commit -m "Initial commit"

# Add remote (replace USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/pitkiot.git
git branch -M main
git push -u origin main
```

### 2. Verify Workflows
- Go to: https://github.com/YOUR_USERNAME/pitkiot
- Click **"Actions"** tab
- Should see build running automatically ✅

### 3. Download Build
- Wait for ✅ green checkmark (5-10 minutes)
- Click the build
- Scroll to **"Artifacts"**
- Download **"build-artifacts"**

---

## 📊 View Builds

**Every Push Triggers New Build:**
```
git add .
git commit -m "Fixed bug X"
git push
→ Automatic build starts on GitHub!
```

**Check Status:**
- Go to Actions tab
- See real-time build logs
- Download artifacts when done

---

## 📱 Test on iPhone

### Option 1: Download IPA File
1. Download build artifacts
2. Connect iPhone to Mac
3. Drag IPA into Xcode
4. Click "Install"
5. Done! ✅

### Option 2: TestFlight (No Mac Needed!)
1. Create Apple Developer account
2. Add secrets to GitHub repo (see `GITHUB_SETUP.md`)
3. Tag release: `git tag v1.0.0 && git push --tags`
4. GitHub builds and uploads automatically
5. Invite testers via TestFlight link
6. They download on iPhone and test! 📱

---

## 🔧 Customize Workflow

Edit `.github/workflows/build.yml`:

**Change target:**
```yaml
-destination 'platform=iOS Simulator,name=iPhone 15'
```

**Add linting:**
```yaml
- name: Lint Code
  run: swiftlint
```

**Add tests:**
```yaml
- name: Run Tests
  run: xcodebuild test
```

---

## 📝 Common Workflow Commands

```powershell
# Push changes (triggers build)
git add .
git commit -m "Description"
git push

# Create version tag (triggers TestFlight upload)
git tag v1.0.0
git push --tags

# View logs locally
git log --oneline

# Check branch status
git status

# Create feature branch
git checkout -b feature/new-feature
git push -u origin feature/new-feature
```

---

## ✅ Workflow Files Included

1. **build.yml** - Basic build on every push
2. **testflight-deploy.yml** - Upload to TestFlight on version tags
3. **GITHUB_SETUP.md** - Full setup guide

---

## 🎯 Workflow States

| Status | Meaning |
|--------|---------|
| ⏳ Yellow | Building... |
| ✅ Green | Build successful! |
| ❌ Red | Build failed - check logs |
| ⏭️ Skipped | Conditions not met |

---

## 🐛 If Build Fails

1. Click the failed build in Actions tab
2. Scroll down to see error message
3. Fix the error in code
4. Commit and push:
   ```powershell
   git add .
   git commit -m "Fix build error"
   git push
   ```
5. New build automatically starts ✅

---

## 📲 Test Different Devices

Modify workflow to test on different simulators:

```yaml
- name: Test on iPhone 15
  run: xcodebuild -destination 'platform=iOS Simulator,name=iPhone 15'

- name: Test on iPhone 14
  run: xcodebuild -destination 'platform=iOS Simulator,name=iPhone 14'

- name: Test on iPad
  run: xcodebuild -destination 'platform=iOS Simulator,name=iPad Pro'
```

---

## 🔄 Automation Benefits

✅ **No Mac needed after setup**
✅ **Builds every time you push**
✅ **Always get latest build**
✅ **Share builds with others**
✅ **Track build history**
✅ **Catch errors early**

---

## 💡 Next: Advanced Setup

After basic setup works:

1. **Add automated tests**: Tests run with every build
2. **TestFlight uploads**: Auto-upload to beta testers
3. **App Store releases**: Auto-submit to App Store
4. **Code coverage**: Track test coverage
5. **Notifications**: Slack/Discord alerts on build status

---

## 🎉 You're All Set!

Every `git push` now:
1. Automatically builds your app
2. Saves the build
3. Lets you download and test
4. Shows build status

**No Mac required for building! Just push your code.** 🚀
