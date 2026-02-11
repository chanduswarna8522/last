# Gen-Z Social

A Flutter Web dating platform with mock authentication and payment flows.

## Features

### Authentication (Mock)
- Sign Up with email/phone
- Login with email/phone
- Social login buttons (Google, Facebook) - Demo only
- No real authentication backend

### Subscription Plans
- **Silver** - ₹99/month
- **Gold** - ₹499/month
- **Platinum** - ₹4,999/month
- **Diamond** - ₹49,999/month

### Pages
1. **Home Page** - Landing page with hero section
2. **Login** - Fake login with social buttons
3. **Sign Up** - Registration form
4. **Select Plan** - Choose subscription plan
5. **Payment** - Mock payment gateway
6. **Payment Success** - Confirmation screen
7. **Explore Profiles** - Card-based profile browsing
8. **Profile View** - Detailed profile with blur effects
9. **Vibe Mode** - Anonymous nickname-based chat
10. **Random Chat** - Gold+ feature for anonymous chat
11. **Settings** - User settings and plan info
12. **Plans & Pricing** - View all plans with comparison

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Chrome browser (for web development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd genz_social
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d chrome
```

### Building for Web

```bash
flutter build web --release
```

The built files will be in `build/web/` directory.

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/                # Data models
│   ├── user_model.dart
│   ├── plan_model.dart
│   ├── profile_model.dart
│   └── message_model.dart
├── screens/               # UI screens
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── select_plan_screen.dart
│   ├── payment_screen.dart
│   ├── payment_success_screen.dart
│   ├── explore_profiles_screen.dart
│   ├── profile_view_screen.dart
│   ├── vibe_mode_screen.dart
│   ├── random_chat_screen.dart
│   ├── settings_screen.dart
│   └── plans_pricing_screen.dart
├── services/              # Business logic
│   └── app_state.dart
├── utils/                 # Utilities
│   ├── theme.dart
│   └── routes.dart
└── widgets/               # Reusable widgets
    ├── custom_button.dart
    ├── custom_input.dart
    ├── profile_card.dart
    ├── plan_card.dart
    └── chat_bubble.dart
```

## Demo Mode

This app is for demonstration purposes only:
- No real authentication
- No real payment processing
- No backend server
- All data is stored in memory only

## Navigation Flow

```
Landing Page → Sign Up/Login → Select Plan → Payment → Explore Profiles
```

## License

This project is for educational purposes only.
