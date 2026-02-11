# Gen-Z Social - Quick Start Guide

## Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK
- Chrome browser

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/genz-social.git
cd genz-social
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run -d chrome
```

## Building for Production

```bash
flutter build web --release
```

The built files will be in `build/web/` directory.

## Navigation Flow

```
┌─────────────────────────────────────────────────────────────┐
│                        HOME PAGE                             │
│              (Landing page with hero section)                │
└─────────────────────────────────────────────────────────────┘
                              │
              ┌───────────────┴───────────────┐
              ▼                               ▼
┌─────────────────────────┐     ┌─────────────────────────┐
│      SIGN UP PAGE       │     │       LOGIN PAGE        │
│  (Create new account)   │     │  (Existing users)       │
└─────────────────────────┘     └─────────────────────────┘
              │                               │
              └───────────────┬───────────────┘
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     SELECT PLAN PAGE                         │
│         (Choose: Silver, Gold, Platinum, Diamond)           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     PAYMENT PAGE                             │
│              (Mock payment - Test Mode)                     │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  PAYMENT SUCCESS PAGE                        │
│              (Confirmation screen)                          │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  EXPLORE PROFILES PAGE                       │
│         (Card-based profile browsing - Tinder style)        │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
┌───────────────┐   ┌─────────────────┐   ┌─────────────────┐
│ PROFILE VIEW  │   │    VIBE MODE    │   │  RANDOM CHAT   │
│ (Detailed     │   │ (Anonymous chat │   │ (Gold+ feature)│
│  profile)     │   │  with intents)  │   │                │
└───────────────┘   └─────────────────┘   └─────────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     SETTINGS PAGE                            │
│         (User settings, plan info, logout)                  │
└─────────────────────────────────────────────────────────────┘
```

## Features

### Authentication (Mock)
- Sign Up with form fields
- Login with email/phone
- Social login buttons (Google, Facebook)
- No real backend

### Subscription Plans
| Plan | Price | Key Features |
|------|-------|--------------|
| Silver | ₹99/mo | Blurred photos, Vibe Mode, 7-day chat delete |
| Gold | ₹499/mo | + Random Chat, Read receipts, Filters |
| Platinum | ₹4,999/mo | + Early unblur, Lifestyle filters, Priority IRL |
| Diamond | ₹49,999/mo | + Always unblur, 1 DM/day, Concierge |

### Billing Cycles
- Monthly: No discount
- 6 Months: 30% discount
- 1 Year: 50% discount

## Demo Mode
All screens include "Demo Mode" or "Test Mode" labels indicating:
- No real authentication
- No real payment processing
- No backend server
- All data is temporary

## Keyboard Shortcuts
- `R` - Hot reload (during development)
- `Q` - Quit (during development)

## Troubleshooting

### Flutter not found
```bash
# Add Flutter to PATH
export PATH="$PATH:/path/to/flutter/bin"
```

### Build fails
```bash
flutter clean
flutter pub get
flutter build web --release
```

### Port already in use
```bash
# Use different port
flutter run -d chrome --web-port=8080
```

## Project Structure
```
lib/
├── main.dart          # App entry point
├── models/            # Data models
├── screens/           # UI screens (12 screens)
├── services/          # Business logic
├── utils/             # Utilities
└── widgets/           # Reusable widgets
```

## Dependencies
- `provider` - State management
- `google_fonts` - Custom fonts
- `intl` - Internationalization

## Support
- Flutter docs: https://docs.flutter.dev
- Provider: https://pub.dev/packages/provider
