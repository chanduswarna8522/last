// Plan Model - Defines subscription plans and their features
import '../utils/theme.dart';
import 'package:flutter/material.dart';

enum PlanType { silver, gold, platinum, diamond }

enum BillingCycle { monthly, sixMonths, yearly }

class PlanModel {
  final PlanType type;
  final String name;
  final double monthlyPrice;
  final List<String> features;
  final List<String> lockedFeatures;
  final Gradient gradient;
  final Color color;
  final IconData icon;
  
  PlanModel({
    required this.type,
    required this.name,
    required this.monthlyPrice,
    required this.features,
    required this.lockedFeatures,
    required this.gradient,
    required this.color,
    required this.icon,
  });
  
  // Get price based on billing cycle
  double getPrice(BillingCycle cycle) {
    switch (cycle) {
      case BillingCycle.monthly:
        return monthlyPrice;
      case BillingCycle.sixMonths:
        return monthlyPrice * 6 * 0.7; // 30% discount
      case BillingCycle.yearly:
        return monthlyPrice * 12 * 0.5; // 50% discount
    }
  }
  
  // Get formatted price string
  String getPriceString(BillingCycle cycle) {
    final price = getPrice(cycle);
    switch (cycle) {
      case BillingCycle.monthly:
        return '₹${monthlyPrice.toInt()} / month';
      case BillingCycle.sixMonths:
        return '₹${price.toInt()} for 6 months';
      case BillingCycle.yearly:
        return '₹${price.toInt()} for 1 year';
    }
  }
  
  // Get savings percentage
  String getSavings(BillingCycle cycle) {
    switch (cycle) {
      case BillingCycle.monthly:
        return '';
      case BillingCycle.sixMonths:
        return 'Save 30%';
      case BillingCycle.yearly:
        return 'Save 50%';
    }
  }
  
  // Plan definitions
  static PlanModel get silver => PlanModel(
    type: PlanType.silver,
    name: 'Silver',
    monthlyPrice: 99,
    features: [
      'Photos blurred until mutual like',
      'Age & distance discovery (18-60)',
      'Vibe Mode: nickname + intent matching',
      'Chats auto-delete in 7 days',
      'Admin-approved eligibility',
    ],
    lockedFeatures: [
      'Random Chat (anonymous)',
      'Read receipts',
      'Verified & intent-based filters',
      'Early photo unblur',
      'Lifestyle + education/work filters',
      'Priority IRL meet suggestions',
      'Always unblur photos',
      '1 first DM/day without match',
      'Concierge support',
      'Advanced filters (IRL ready, income band)',
    ],
    gradient: const LinearGradient(
      colors: [Colors.grey, Color(0xFFB8B8B8)],
    ),
    color: Colors.grey,
    icon: Icons.star,
  );
  
  static PlanModel get gold => PlanModel(
    type: PlanType.gold,
    name: 'Gold',
    monthlyPrice: 499,
    features: [
      'Everything in Silver',
      'Random Chat (anonymous)',
      'Read receipts',
      'Verified & intent-based filters',
    ],
    lockedFeatures: [
      'Early photo unblur',
      'Lifestyle + education/work filters',
      'Priority IRL meet suggestions',
      'Always unblur photos',
      '1 first DM/day without match',
      'Concierge support',
      'Advanced filters (IRL ready, income band)',
    ],
    gradient: AppTheme.goldGradient,
    color: AppTheme.goldColor,
    icon: Icons.workspace_premium,
  );
  
  static PlanModel get platinum => PlanModel(
    type: PlanType.platinum,
    name: 'Platinum',
    monthlyPrice: 4999,
    features: [
      'Everything in Gold',
      'Early photo unblur',
      'Lifestyle + education/work filters',
      'Priority IRL meet suggestions',
    ],
    lockedFeatures: [
      'Always unblur photos',
      '1 first DM/day without match',
      'Concierge support',
      'Advanced filters (IRL ready, income band)',
    ],
    gradient: AppTheme.platinumGradient,
    color: AppTheme.platinumColor,
    icon: Icons.diamond,
  );
  
  static PlanModel get diamond => PlanModel(
    type: PlanType.diamond,
    name: 'Diamond',
    monthlyPrice: 49999,
    features: [
      'Everything in Platinum',
      'Always unblur photos',
      '1 first DM/day without match (text only)',
      'Concierge support (UI only)',
      'Advanced filters (IRL ready, income band)',
    ],
    lockedFeatures: [],
    gradient: AppTheme.diamondGradient,
    color: AppTheme.diamondColor,
    icon: Icons.auto_awesome,
  );
  
  static List<PlanModel> get allPlans => [silver, gold, platinum, diamond];
}
