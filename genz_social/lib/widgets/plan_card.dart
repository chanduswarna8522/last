// Plan Card Widget - Display subscription plan details
import 'package:flutter/material.dart';
import '../models/plan_model.dart';
import '../utils/theme.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;
  final BillingCycle billingCycle;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showSelectButton;
  
  const PlanCard({
    super.key,
    required this.plan,
    required this.billingCycle,
    this.isSelected = false,
    required this.onTap,
    this.showSelectButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? plan.gradient : null,
          color: isSelected ? null : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? plan.color : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: plan.color.withOpacity(0.3),
              blurRadius: isSelected ? 20 : 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plan Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? Colors.white.withOpacity(0.2) 
                          : plan.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      plan.icon,
                      color: isSelected ? Colors.white : plan.color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : AppTheme.primaryText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          plan.getPriceString(billingCycle),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected 
                                ? Colors.white.withOpacity(0.9) 
                                : AppTheme.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (plan.getSavings(billingCycle).isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? Colors.white.withOpacity(0.3) 
                            : AppTheme.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        plan.getSavings(billingCycle),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppTheme.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Features
              Text(
                'What\'s included:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected 
                      ? Colors.white.withOpacity(0.8) 
                      : AppTheme.secondaryText,
                ),
              ),
              const SizedBox(height: 12),
              ...plan.features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: isSelected ? Colors.white : Colors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 13,
                            color: isSelected 
                                ? Colors.white.withOpacity(0.9) 
                                : AppTheme.primaryText,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              
              // Locked Features
              if (plan.lockedFeatures.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Upgrade to unlock:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected 
                        ? Colors.white.withOpacity(0.6) 
                        : AppTheme.mutedText,
                  ),
                ),
                const SizedBox(height: 12),
                ...plan.lockedFeatures.take(3).map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: isSelected 
                              ? Colors.white.withOpacity(0.5) 
                              : AppTheme.mutedText,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected 
                                  ? Colors.white.withOpacity(0.5) 
                                  : AppTheme.mutedText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
              
              // Select Button
              if (showSelectButton) ...[
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected 
                          ? Colors.white 
                          : plan.color,
                      foregroundColor: isSelected 
                          ? plan.color 
                          : Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      isSelected ? 'Selected' : 'Select ${plan.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Compact Plan Card for horizontal scrolling
class CompactPlanCard extends StatelessWidget {
  final PlanModel plan;
  final bool isSelected;
  final VoidCallback onTap;
  
  const CompactPlanCard({
    super.key,
    required this.plan,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? plan.gradient : null,
          color: isSelected ? null : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? plan.color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                plan.icon,
                color: isSelected ? Colors.white : plan.color,
                size: 32,
              ),
              const SizedBox(height: 12),
              Text(
                plan.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '₹${plan.monthlyPrice.toInt()}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected 
                      ? Colors.white.withOpacity(0.9) 
                      : AppTheme.secondaryText,
                ),
              ),
              Text(
                '/month',
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected 
                      ? Colors.white.withOpacity(0.7) 
                      : AppTheme.mutedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
