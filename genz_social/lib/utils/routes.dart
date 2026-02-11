import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/select_plan_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/payment_success_screen.dart';
import '../screens/explore_profiles_screen.dart';
import '../screens/profile_view_screen.dart';
import '../screens/vibe_mode_screen.dart';
import '../screens/random_chat_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/plans_pricing_screen.dart';

class Routes {
  // Route Names
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String selectPlan = '/select-plan';
  static const String payment = '/payment';
  static const String paymentSuccess = '/payment-success';
  static const String exploreProfiles = '/explore-profiles';
  static const String profileView = '/profile-view';
  static const String vibeMode = '/vibe-mode';
  static const String randomChat = '/random-chat';
  static const String settings = '/settings';
  static const String plansPricing = '/plans-pricing';

  // Route Map
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      selectPlan: (context) => const SelectPlanScreen(),
      payment: (context) => const PaymentScreen(),
      paymentSuccess: (context) => const PaymentSuccessScreen(),
      exploreProfiles: (context) => const ExploreProfilesScreen(),
      profileView: (context) => const ProfileViewScreen(),
      vibeMode: (context) => const VibeModeScreen(),
      randomChat: (context) => const RandomChatScreen(),
      settings: (context) => const SettingsScreen(),
      plansPricing: (context) => const PlansPricingScreen(),
    };
  }
}
