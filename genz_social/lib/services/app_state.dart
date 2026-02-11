// App State - Global state management using Provider
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/plan_model.dart';
import '../models/profile_model.dart';

class AppState extends ChangeNotifier {
  // Current User
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  
  // Selected Plan
  PlanModel _selectedPlan = PlanModel.silver;
  PlanModel get selectedPlan => _selectedPlan;
  
  // Billing Cycle
  BillingCycle _billingCycle = BillingCycle.monthly;
  BillingCycle get billingCycle => _billingCycle;
  
  // Is Logged In
  bool get isLoggedIn => _currentUser != null;
  
  // Is Plan Selected
  bool get isPlanSelected => _selectedPlan != null;
  
  // Payment Status
  bool _isPaymentComplete = false;
  bool get isPaymentComplete => _isPaymentComplete;
  
  // Liked Profiles (for demo)
  final List<String> _likedProfiles = [];
  List<String> get likedProfiles => _likedProfiles;
  
  // Current Profile Index for Explore
  int _currentProfileIndex = 0;
  int get currentProfileIndex => _currentProfileIndex;
  
  // Set User (after signup)
  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }
  
  // Set Plan
  void setPlan(PlanModel plan) {
    _selectedPlan = plan;
    notifyListeners();
  }
  
  // Set Billing Cycle
  void setBillingCycle(BillingCycle cycle) {
    _billingCycle = cycle;
    notifyListeners();
  }
  
  // Complete Payment
  void completePayment() {
    _isPaymentComplete = true;
    notifyListeners();
  }
  
  // Like Profile
  void likeProfile(String profileId) {
    if (!_likedProfiles.contains(profileId)) {
      _likedProfiles.add(profileId);
      notifyListeners();
    }
  }
  
  // Pass Profile
  void passProfile(String profileId) {
    // Just move to next profile
    nextProfile();
  }
  
  // Next Profile
  void nextProfile() {
    _currentProfileIndex++;
    if (_currentProfileIndex >= DummyProfiles.profiles.length) {
      _currentProfileIndex = 0; // Loop back
    }
    notifyListeners();
  }
  
  // Reset Profile Index
  void resetProfileIndex() {
    _currentProfileIndex = 0;
    notifyListeners();
  }
  
  // Logout
  void logout() {
    _currentUser = null;
    _selectedPlan = PlanModel.silver;
    _billingCycle = BillingCycle.monthly;
    _isPaymentComplete = false;
    _likedProfiles.clear();
    _currentProfileIndex = 0;
    notifyListeners();
  }
  
  // Check if feature is available based on plan
  bool isFeatureAvailable(String feature) {
    // Check if feature is in selected plan's features
    return _selectedPlan.features.any((f) => 
      f.toLowerCase().contains(feature.toLowerCase())
    );
  }
  
  // Check if photos should be blurred
  bool get shouldBlurPhotos {
    // Silver plan always blurs photos
    // Gold plan blurs until mutual like
    // Platinum has early unblur
    // Diamond always unblurs
    if (_selectedPlan.type == PlanType.diamond) return false;
    if (_selectedPlan.type == PlanType.platinum) return false;
    return true; // Silver and Gold blur photos
  }
  
  // Get plan color
  Color get planColor => _selectedPlan.color;
  
  // Get plan gradient
  Gradient get planGradient => _selectedPlan.gradient;
}
