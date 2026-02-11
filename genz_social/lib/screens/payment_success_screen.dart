// Payment Success Screen - Shows successful payment confirmation
import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/custom_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Animation (using Icon as fallback)
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 100,
                  color: Colors.green,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Title
              const Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle
              const Text(
                'Your subscription has been activated',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.secondaryText,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              
              // Test Mode Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Colors.orange.withOpacity(0.8),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Test Mode - No real transaction',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.orange.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Features List
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildFeatureItem(
                      icon: Icons.verified_user_outlined,
                      text: 'Premium features unlocked',
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem(
                      icon: Icons.favorite_outline,
                      text: 'Start exploring profiles',
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem(
                      icon: Icons.chat_bubble_outline,
                      text: 'Chat with your matches',
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Continue Button
              CustomButton(
                text: 'Start Exploring',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context, 
                    Routes.exploreProfiles,
                  );
                },
              ),
              
              const SizedBox(height: 16),
              
              // View Plans Button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.plansPricing);
                },
                child: const Text(
                  'View All Plans',
                  style: TextStyle(
                    color: AppTheme.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: AppTheme.primaryText,
          ),
        ),
      ],
    );
  }
}
