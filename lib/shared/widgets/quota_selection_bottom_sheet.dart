import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/data/mock_quotas.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';

class QuotaSelectionBottomSheet extends StatelessWidget {
  const QuotaSelectionBottomSheet({super.key});

  static Future<QuotaOverview?> show(BuildContext context) {
    return showModalBottomSheet<QuotaOverview>(
      context: context,
      backgroundColor: AppColors.canvas,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const QuotaSelectionBottomSheet(),
    );
  }

  IconData _getIconForCategory(QuotaCategory category) {
    switch (category) {
      case QuotaCategory.property:
        return Icons.home_work_outlined;
      case QuotaCategory.vehicle:
        return Icons.directions_car_outlined;
      case QuotaCategory.services:
        return Icons.handyman_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selecionar cota',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textSecondary,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: mockQuotas.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final quota = mockQuotas[index];
                  String statusText = 'Ativa';
                  if (quota.status == QuotaStatus.underReview) {
                    statusText = 'Em análise';
                  }

                  return QuotaSelectionCard(
                    title: quota.title,
                    description: 'Grupo ${quota.group} • Cota ${quota.number}',
                    icon: _getIconForCategory(quota.category),
                    status: statusText,
                    showSelectionControl: false,
                    onPressed: () => Navigator.of(context).pop(quota),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
