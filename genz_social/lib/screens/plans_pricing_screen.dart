// Plans & Pricing Screen - Display all subscription plans
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/plan_model.dart';
import '../services/app_state.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/plan_card.dart';

class PlansPricingScreen extends StatefulWidget {
  const PlansPricingScreen({super.key});

  @override
  State<PlansPricingScreen> createState() => _PlansPricingScreenState();
}

class _PlansPricingScreenState extends State<PlansPricingScreen> {
  BillingCycle _billingCycle = BillingCycle.monthly;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
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
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  const Text(
                    'Plans & Pricing',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  const Text(
                    'Choose the perfect plan for your dating journey',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.secondaryText,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Billing Cycle Toggle
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        _buildCycleButton('Monthly', BillingCycle.monthly),
                        _buildCycleButton('6 Months', BillingCycle.sixMonths),
                        _buildCycleButton('1 Year', BillingCycle.yearly),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Plans List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: PlanModel.allPlans.length,
                itemBuilder: (context, index) {
                  final plan = PlanModel.allPlans[index];
                  final isCurrentPlan = appState.selectedPlan.type == plan.type;
                  
                  return PlanCard(
                    plan: plan,
                    billingCycle: _billingCycle,
                    isSelected: isCurrentPlan,
                    onTap: () {
                      // Update plan in app state
                      appState.setPlan(plan);
                      appState.setBillingCycle(_billingCycle);
                      
                      // Show confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${plan.name} plan selected (Demo)'),
                          backgroundColor: plan.color,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      
                      // Navigate to payment if not current plan
                      if (!isCurrentPlan) {
                        Navigator.pushNamed(context, Routes.payment);
                      }
                    },
                  );
                },
              ),
            ),
            
            // Compare Plans Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        _showComparisonSheet(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primaryText,
                        side: BorderSide(
                          color: AppTheme.secondaryText.withOpacity(0.3),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Compare All Plans',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCycleButton(String text, BillingCycle cycle) {
    final isSelected = _billingCycle == cycle;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _billingCycle = cycle;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? Colors.white : AppTheme.secondaryText,
            ),
          ),
        ),
      ),
    );
  }

  void _showComparisonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppTheme.mutedText,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  const Text(
                    'Plan Comparison',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        _buildComparisonTable(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildComparisonTable() {
    final features = [
      'Photos blurred until mutual like',
      'Age & distance discovery',
      'Vibe Mode',
      'Chats auto-delete in 7 days',
      'Random Chat (anonymous)',
      'Read receipts',
      'Verified & intent-based filters',
      'Early photo unblur',
      'Lifestyle + education/work filters',
      'Priority IRL meet suggestions',
      'Always unblur photos',
      '1 first DM/day without match',
      'Concierge support',
      'Advanced filters',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              const SizedBox(width: 200),
              ...PlanModel.allPlans.map((plan) {
                return Container(
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: plan.gradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    plan.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Feature Rows
          ...features.map((feature) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.surfaceColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                  ...PlanModel.allPlans.map((plan) {
                    final hasFeature = plan.features.any(
                      (f) => f.toLowerCase().contains(feature.toLowerCase()) ||
                             feature.toLowerCase().contains(f.toLowerCase().split(' ').first),
                    );
                    
                    return Container(
                      width: 80,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 8),
                      child: Icon(
                        hasFeature ? Icons.check_circle : Icons.cancel,
                        color: hasFeature ? Colors.green : AppTheme.mutedText,
                        size: 20,
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
