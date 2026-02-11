// Select Plan Screen - Choose subscription plan after signup
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/plan_model.dart';
import '../services/app_state.dart';
import '../utils/theme.dart';
import '../utils/routes.dart';
import '../widgets/plan_card.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  PlanType _selectedPlanType = PlanType.silver;
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
                  // Back Button
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
                    'Choose Your Plan',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  const Text(
                    'Select the perfect plan for your dating journey',
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
                  return PlanCard(
                    plan: plan,
                    billingCycle: _billingCycle,
                    isSelected: _selectedPlanType == plan.type,
                    onTap: () {
                      setState(() {
                        _selectedPlanType = plan.type;
                      });
                    },
                  );
                },
              ),
            ),
            
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Selected Plan Summary
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          PlanModel.allPlans
                              .firstWhere((p) => p.type == _selectedPlanType)
                              .icon,
                          color: PlanModel.allPlans
                              .firstWhere((p) => p.type == _selectedPlanType)
                              .color,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                PlanModel.allPlans
                                    .firstWhere((p) => p.type == _selectedPlanType)
                                    .name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryText,
                                ),
                              ),
                              Text(
                                PlanModel.allPlans
                                    .firstWhere((p) => p.type == _selectedPlanType)
                                    .getPriceString(_billingCycle),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Save selected plan
                        final selectedPlan = PlanModel.allPlans
                            .firstWhere((p) => p.type == _selectedPlanType);
                        appState.setPlan(selectedPlan);
                        appState.setBillingCycle(_billingCycle);
                        
                        // Navigate to payment
                        Navigator.pushNamed(context, Routes.payment);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Continue to Payment',
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
}
