// Sign Up Screen - Fake registration with form fields
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  
  String? _selectedGender;
  bool _isLoading = false;
  
  final List<String> _genders = ['Male', 'Female', 'Other', 'Prefer not to say'];

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Fake sign up - no actual registration
  void _handleSignUp() {
    setState(() => _isLoading = true);
    
    // Create user model (stored in memory only)
    final user = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: _fullNameController.text.isNotEmpty 
          ? _fullNameController.text 
          : 'Demo User',
      age: _ageController.text.isNotEmpty 
          ? int.tryParse(_ageController.text) ?? 22 
          : 22,
      gender: _selectedGender ?? 'Other',
      city: _cityController.text.isNotEmpty 
          ? _cityController.text 
          : 'Mumbai',
      email: _emailController.text.isNotEmpty 
          ? _emailController.text 
          : 'demo@example.com',
      phoneNumber: _phoneController.text.isNotEmpty 
          ? _phoneController.text 
          : '+91 9876543210',
    );
    
    // Simulate network delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      
      // Store user in app state
      context.read<AppState>().setUser(user);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created! (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      // Navigate to select plan
      Navigator.pushReplacementNamed(context, Routes.selectPlan);
    });
  }

  // Fake Google sign up
  void _handleGoogleSignUp() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);
      
      // Create dummy user
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fullName: 'Google User',
        age: 24,
        gender: 'Other',
        city: 'Mumbai',
        email: 'google.user@example.com',
        phoneNumber: '+91 9876543210',
      );
      
      context.read<AppState>().setUser(user);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signed up with Google (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushReplacementNamed(context, Routes.selectPlan);
    });
  }

  // Fake Facebook sign up
  void _handleFacebookSignUp() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);
      
      // Create dummy user
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fullName: 'Facebook User',
        age: 25,
        gender: 'Other',
        city: 'Delhi',
        email: 'facebook.user@example.com',
        phoneNumber: '+91 9876543210',
      );
      
      context.read<AppState>().setUser(user);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signed up with Facebook (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushReplacementNamed(context, Routes.selectPlan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Back Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppTheme.primaryText,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Title
              const Text(
                'Create\nAccount 🎉',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                  height: 1.2,
                ),
              ),
              
              const SizedBox(height: 12),
              
              const Text(
                'Join Gen-Z Social and find your vibe',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.secondaryText,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Demo Mode Badge
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppTheme.primaryColor.withOpacity(0.8),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Demo Mode: No real registration required',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.primaryColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Form Fields
              CustomInputField(
                label: 'Full Name',
                hint: 'Enter your full name',
                controller: _fullNameController,
                prefixIcon: Icons.person_outline,
              ),
              
              const SizedBox(height: 20),
              
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      label: 'Age',
                      hint: 'Age',
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.cake_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomDropdownField<String>(
                      label: 'Gender',
                      value: _selectedGender,
                      hint: 'Select',
                      items: _genders.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              CustomInputField(
                label: 'City',
                hint: 'Enter your city',
                controller: _cityController,
                prefixIcon: Icons.location_city_outlined,
              ),
              
              const SizedBox(height: 20),
              
              CustomInputField(
                label: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              
              const SizedBox(height: 20),
              
              CustomInputField(
                label: 'Phone Number',
                hint: 'Enter your phone number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_outlined,
              ),
              
              const SizedBox(height: 32),
              
              // Continue Button
              CustomButton(
                text: 'Continue',
                onPressed: _handleSignUp,
                isLoading: _isLoading,
              ),
              
              const SizedBox(height: 24),
              
              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppTheme.secondaryText.withOpacity(0.3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppTheme.secondaryText.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Social Login Buttons
              SocialLoginButton(
                text: 'Continue with Google',
                onPressed: _handleGoogleSignUp,
                iconAsset: 'google',
              ),
              
              const SizedBox(height: 12),
              
              SocialLoginButton(
                text: 'Continue with Facebook',
                onPressed: _handleFacebookSignUp,
                iconAsset: 'facebook',
                backgroundColor: const Color(0xFF1877F2),
                textColor: Colors.white,
              ),
              
              const SizedBox(height: 24),
              
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.login),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
