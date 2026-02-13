# GitHub Actions Setup Guide for Pitkiot

## 📋 Prerequisites

1. **GitHub Account** (free)
2. **Apple Developer Account** (free, for TestFlight distribution)
3. Your code pushed to GitHub repository

## ✅ Step 1: Create GitHub Repository

### Option A: New Repository
1. Go to [github.com](https://github.com)
2. Click **"New"** → **"New repository"**
3. Name it: `pitkiot` (or any name)
4. Choose **Public** or **Private**
5. Click **"Create repository"**

### Option B: Existing Repository
If you already have a repo, skip to Step 2

---

## 📤 Step 2: Push Your Code to GitHub

On your Windows machine, open PowerShell:

```powershell
# Navigate to project folder
cd "c:\Users\ofeka\OneDrive\Desktop\school\presonal projects\HebrewAlias"

# Initialize git (if not already done)
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Pitkiot game app"

# Add GitHub as remote
git remote add origin https://github.com/YOUR_USERNAME/pitkiot.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Replace `YOUR_USERNAME` with your actual GitHub username!**

---

## 🔐 Step 3: Configure Secrets (Optional - for TestFlight)

If you want to upload to TestFlight automatically:

1. Go to your GitHub repo
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**
4. Add these secrets:
   - `APPLE_ID`: Your Apple ID email
   - `APPLE_ID_PASSWORD`: Your Apple ID app password
   - `TEAM_ID`: Your Apple Team ID

---

## 🚀 Step 4: GitHub Actions Workflow

The workflow file is already created at:
```
.github/workflows/build.yml
```

### What it does:
✅ Automatically builds when you push code
✅ Runs on macOS (has Xcode)
✅ Compiles the Pitkiot app
✅ Saves build artifacts
✅ Shows build status

---

## 📊 Step 5: View Build Status

1. Push code to GitHub (using commands from Step 2)
2. Go to your repo on GitHub
3. Click **"Actions"** tab
4. Watch the build progress in real-time
5. ✅ Green checkmark = Build succeeded
6. ❌ Red X = Build failed

---

## 📥 Step 6: Download Build Artifacts

After successful build:

1. Click the build run in Actions tab
2. Scroll down to **"Artifacts"** section
3. Click **"build-artifacts"** to download
4. Extract the ZIP file
5. Find your compiled app

---

## 🧪 Testing Options After Build

### Option A: TestFlight (Easiest for iPhone testing)
1. Configure Apple secrets (Step 3)
2. Build uploads automatically
3. Install TestFlight app on iPhone
4. Accept test invitation
5. Download and test app

### Option B: Simulator Testing
1. Download build artifacts
2. Use Xcode to run on simulator
3. Test on virtual iPhone

### Option C: Ad-Hoc Distribution
1. Use generated IPA file
2. Distribute to testers via email/link

---

## 🔄 Automated Build Workflow

After setup, every time you:
1. **Push code to GitHub** → Automatic build starts
2. **Create a pull request** → Automatic build for testing
3. **Merge to main** → Automatic production build

No Mac needed! GitHub's Mac servers handle it all! 🎉

---

## 📝 Example Workflow

```
1. You make code changes on Windows
2. Git push to GitHub
3. GitHub Actions automatically:
   ✅ Checks out code
   ✅ Compiles with Xcode
   ✅ Runs tests (if configured)
   ✅ Uploads artifacts
   ✅ Notifies you of success/failure
4. You download and test the build
5. Repeat!
```

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **"Build failed"** | Check Actions tab for error message, fix code, push again |
| **"No artifacts found"** | Build failed - check workflow logs for errors |
| **"Permission denied"** | Check GitHub credentials in git config |
| **"No matching signing identity"** | Normal for simulator builds, add Apple secrets for device builds |

---

## 💡 Next Steps

### For Testing on iPhone
1. Set up Apple secrets
2. Modify workflow to upload to TestFlight
3. Download TestFlight app on iPhone
4. Join beta testing group

### For App Store Release
1. Complete app store configuration in `APP_STORE_CONFIG.md`
2. Create app store secrets
3. Modify workflow to upload to App Store Connect
4. Submit for review

### For Continuous Updates
- Push code → Automatic build
- Every version automatically builds
- Share TestFlight link with others
- They install and test on real iPhone!

---

## 🚀 Quick Start Checklist

- [ ] Create GitHub account
- [ ] Create new repository
- [ ] Clone/push code using commands above
- [ ] Workflow file exists at `.github/workflows/build.yml`
- [ ] Go to Actions tab
- [ ] Watch first build complete
- [ ] Download artifacts when ready
- [ ] Share with testers!

---

## 📞 Common Commands

```powershell
# Check git status
git status

# Push changes
git push

# Pull latest changes
git pull

# Create new branch for features
git checkout -b feature/my-feature

# Commit and push changes
git add .
git commit -m "Description of changes"
git push
```

---

**That's it! 🎉 You now have automated builds for Pitkiot!**

Every time you push code, GitHub automatically builds your app on their Mac servers. No local Mac needed!
