// Login Screen - Fake authentication with social login buttons
import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Fake login - no actual authentication
  void _handleLogin() {
    setState(() => _isLoading = true);
    
    // Simulate network delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      // Navigate to explore profiles
      Navigator.pushReplacementNamed(context, Routes.exploreProfiles);
    });
  }

  // Fake Google login
  void _handleGoogleLogin() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in with Google (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushReplacementNamed(context, Routes.exploreProfiles);
    });
  }

  // Fake Facebook login
  void _handleFacebookLogin() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in with Facebook (Demo Mode)'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushReplacementNamed(context, Routes.exploreProfiles);
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
              const SizedBox(height: 40),
              
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
              
              const SizedBox(height: 40),
              
              // Title
              const Text(
                'Welcome\nBack! 👋',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                  height: 1.2,
                ),
              ),
              
              const SizedBox(height: 12),
              
              const Text(
                'Sign in to continue exploring profiles',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.secondaryText,
                ),
              ),
              
              const SizedBox(height: 40),
              
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
                        'Demo Mode: No real authentication required',
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
              
              // Email Input
              CustomInputField(
                label: 'Email or Phone',
                hint: 'Enter your email or phone number',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              
              const SizedBox(height: 32),
              
              // Continue Button
              CustomButton(
                text: 'Continue',
                onPressed: _handleLogin,
                isLoading: _isLoading,
              ),
              
              const SizedBox(height: 32),
              
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
              
              const SizedBox(height: 32),
              
              // Social Login Buttons
              SocialLoginButton(
                text: 'Continue with Google',
                onPressed: _handleGoogleLogin,
                iconAsset: 'google',
              ),
              
              const SizedBox(height: 16),
              
              SocialLoginButton(
                text: 'Continue with Facebook',
                onPressed: _handleFacebookLogin,
                iconAsset: 'facebook',
                backgroundColor: const Color(0xFF1877F2),
                textColor: Colors.white,
              ),
              
              const SizedBox(height: 32),
              
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.signup),
                    child: const Text(
                      'Sign Up',
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
