// Explore Profiles Screen - Card-based profile browsing
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/profile_model.dart';
import '../services/app_state.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/profile_card.dart';

class ExploreProfilesScreen extends StatefulWidget {
  const ExploreProfilesScreen({super.key});

  @override
  State<ExploreProfilesScreen> createState() => _ExploreProfilesScreenState();
}

class _ExploreProfilesScreenState extends State<ExploreProfilesScreen> {
  int _currentIndex = 0;

  void _handleLike() {
    final profile = DummyProfiles.profiles[_currentIndex];
    context.read<AppState>().likeProfile(profile.id);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You liked ${profile.name}! (Demo)'),
        backgroundColor: AppTheme.primaryColor,
        duration: const Duration(seconds: 1),
      ),
    );
    
    _nextProfile();
  }

  void _handlePass() {
    _nextProfile();
  }

  void _nextProfile() {
    setState(() {
      _currentIndex++;
      if (_currentIndex >= DummyProfiles.profiles.length) {
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final shouldBlur = appState.shouldBlurPhotos;
    final currentProfile = DummyProfiles.profiles[_currentIndex];
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settings);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                  
                  // Logo
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppTheme.primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Gen-Z Social',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryText,
                        ),
                      ),
                    ],
                  ),
                  
                  // Messages Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.vibeMode);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Current Plan Badge
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: appState.planGradient,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    appState.selectedPlan.icon,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${appState.selectedPlan.name} Plan',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Profile Card
            Expanded(
              child: ProfileCard(
                profile: currentProfile,
                isBlurred: shouldBlur,
                onLike: _handleLike,
                onPass: _handlePass,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.profileView,
                    arguments: currentProfile,
                  );
                },
              ),
            ),
            
            // Bottom Navigation
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: Icons.home,
                    label: 'Home',
                    isActive: true,
                    onTap: () {},
                  ),
                  _buildNavItem(
                    icon: Icons.explore,
                    label: 'Explore',
                    isActive: false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.plansPricing);
                    },
                  ),
                  _buildNavItem(
                    icon: Icons.chat,
                    label: 'Chat',
                    isActive: false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.randomChat);
                    },
                  ),
                  _buildNavItem(
                    icon: Icons.settings,
                    label: 'Settings',
                    isActive: false,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settings);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppTheme.primaryColor : AppTheme.mutedText,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? AppTheme.primaryColor : AppTheme.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}
