# Gen-Z Social - Project Summary

## Overview
A complete Flutter Web dating application with mock authentication and payment flows.

## Features Implemented

### 1. Authentication (Mock)
- ✅ Sign Up page with form fields (Full Name, Age, Gender, City, Email, Phone)
- ✅ Login page with email/phone input
- ✅ Social login buttons (Google, Facebook) - Demo only
- ✅ No real authentication backend
- ✅ Toast messages for demo mode

### 2. Subscription Plans
- ✅ Silver - ₹99/month
- ✅ Gold - ₹499/month
- ✅ Platinum - ₹4,999/month
- ✅ Diamond - ₹49,999/month
- ✅ Monthly, 6-month (30% off), 1-year (50% off) billing cycles
- ✅ Automatic price calculation
- ✅ Plan comparison feature

### 3. Pages
1. ✅ **Home Page** - Hero section with tagline and CTAs
2. ✅ **Login** - Fake authentication with social buttons
3. ✅ **Sign Up** - Registration form
4. ✅ **Select Plan** - Plan selection after signup
5. ✅ **Payment** - Mock payment gateway with card fields
6. ✅ **Payment Success** - Confirmation screen
7. ✅ **Explore Profiles** - Card-based profile browsing
8. ✅ **Profile View** - Detailed profile with blur effects
9. ✅ **Vibe Mode** - Anonymous nickname-based chat
10. ✅ **Random Chat** - Gold+ feature for anonymous chat
11. ✅ **Settings** - User settings and plan info
12. ✅ **Plans & Pricing** - View all plans with comparison

### 4. Key Features
- ✅ Photo blur based on plan level
- ✅ Like/Pass functionality
- ✅ Intent tags (Cuffing, Situationship, etc.)
- ✅ Anonymous chat with nicknames
- ✅ Feature locks for lower tiers
- ✅ Responsive design for desktop & mobile
- ✅ Smooth animations and transitions

## Project Structure
```
genz_social/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── plan_model.dart
│   │   ├── profile_model.dart
│   │   └── message_model.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── select_plan_screen.dart
│   │   ├── payment_screen.dart
│   │   ├── payment_success_screen.dart
│   │   ├── explore_profiles_screen.dart
│   │   ├── profile_view_screen.dart
│   │   ├── vibe_mode_screen.dart
│   │   ├── random_chat_screen.dart
│   │   ├── settings_screen.dart
│   │   └── plans_pricing_screen.dart
│   ├── services/
│   │   └── app_state.dart
│   ├── utils/
│   │   ├── theme.dart
│   │   └── routes.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_input.dart
│       ├── profile_card.dart
│       ├── plan_card.dart
│       └── chat_bubble.dart
├── web/
│   ├── index.html
│   └── manifest.json
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
├── README.md
├── PROJECT_SUMMARY.md
└── build_web.sh
```

## Dependencies
- flutter (SDK)
- cupertino_icons: ^1.0.2
- google_fonts: ^6.1.0
- intl: ^0.18.1
- provider: ^6.1.1

## Navigation Flow
```
Home Page
    ↓
Sign Up / Login → (Social Login) → Explore Profiles
    ↓
Select Plan
    ↓
Payment (Test Mode)
    ↓
Payment Success
    ↓
Explore Profiles → Profile View / Vibe Mode / Random Chat / Settings
```

## How to Build

### Prerequisites
- Flutter SDK 3.0.0+
- Dart SDK
- Chrome browser

### Build Commands
```bash
# Get dependencies
flutter pub get

# Run in debug mode
flutter run -d chrome

# Build for production
flutter build web --release
```

### Using Build Script
```bash
chmod +x build_web.sh
./build_web.sh
```

## Demo Mode Labels
All screens include "Demo Mode" or "Test Mode" labels to indicate:
- No real authentication
- No real payment processing
- No backend server
- All data is temporary

## Code Quality
- ✅ Clean folder structure
- ✅ Reusable widgets
- ✅ Dummy data models
- ✅ Clear code comments
- ✅ No Firebase dependencies
- ✅ No real backend dependencies
- ✅ Provider for state management

## Testing Checklist
- [x] All imports are correct
- [x] No syntax errors
- [x] All routes defined
- [x] All screens created
- [x] Theme consistency
- [x] Responsive design
- [x] Mock data available
- [x] Navigation flows complete
