# Gen-Z Social - Deployment Guide

## GitHub Deployment

### Step 1: Initialize Git Repository
```bash
cd genz_social
git init
git add .
git commit -m "Initial commit: Gen-Z Social Flutter Web App"
```

### Step 2: Create GitHub Repository
1. Go to https://github.com
2. Click "New Repository"
3. Name it "genz-social"
4. Make it public or private
5. Do NOT initialize with README (we already have one)

### Step 3: Push to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/genz-social.git
git branch -M main
git push -u origin main
```

## Building for Production

### Option 1: Local Build
```bash
# Navigate to project
cd genz_social

# Get dependencies
flutter pub get

# Build for web
flutter build web --release

# Output will be in build/web/
```

### Option 2: Using Build Script
```bash
chmod +x build_web.sh
./build_web.sh
```

## GitHub Pages Deployment

### Step 1: Build the Project
```bash
flutter build web --release --base-href /genz-social/
```

### Step 2: Deploy to gh-pages Branch
```bash
# Create gh-pages branch
git checkout --orphan gh-pages

# Remove all files except build/web
git rm -rf .
cp -r build/web/* .

# Commit and push
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

### Step 3: Enable GitHub Pages
1. Go to repository Settings
2. Navigate to Pages section
3. Select "gh-pages" branch as source
4. Save

## Firebase Hosting Deployment

### Step 1: Install Firebase CLI
```bash
npm install -g firebase-tools
```

### Step 2: Initialize Firebase
```bash
firebase login
firebase init hosting
```

### Step 3: Deploy
```bash
firebase deploy
```

## Netlify Deployment

### Option 1: Drag and Drop
1. Build the project: `flutter build web --release`
2. Go to https://netlify.com
3. Drag and drop the `build/web` folder

### Option 2: Git Integration
1. Connect GitHub repository to Netlify
2. Set build command: `flutter build web --release`
3. Set publish directory: `build/web`

## Vercel Deployment

### Step 1: Install Vercel CLI
```bash
npm install -g vercel
```

### Step 2: Deploy
```bash
vercel --prod
```

## Environment Requirements

### Development
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Chrome browser

### Production Build
- No server-side requirements
- Static files only
- Can be hosted on any static hosting service

## Build Output
After running `flutter build web --release`, the following files will be generated in `build/web/`:
- `index.html` - Main entry point
- `flutter.js` - Flutter bootstrap
- `flutter_bootstrap.js` - Flutter bootstrap (generated)
- `assets/` - Static assets
- `icons/` - App icons
- `manifest.json` - PWA manifest

## Testing Before Deployment

1. **Run locally:**
```bash
flutter run -d chrome
```

2. **Check for errors:**
```bash
flutter analyze
```

3. **Build and verify:**
```bash
flutter build web --release
```

## Troubleshooting

### Issue: Build fails
- Run `flutter clean`
- Run `flutter pub get`
- Try building again

### Issue: Images not loading
- Check image URLs are accessible
- Verify CORS settings on image server

### Issue: Routes not working
- Ensure `base-href` is set correctly for subdirectory deployment

### Issue: Provider errors
- Make sure `ChangeNotifierProvider` is at the root of the app
- Check all `context.watch()` and `context.read()` calls

## Demo Mode Notice
This app is for demonstration purposes:
- No real authentication
- No real payment processing
- No backend required
- All data is temporary

## Support
For issues or questions, please refer to:
- Flutter documentation: https://docs.flutter.dev
- Provider package: https://pub.dev/packages/provider
