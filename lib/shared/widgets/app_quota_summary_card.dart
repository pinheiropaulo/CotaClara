import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class AppQuotaSummaryCard extends StatelessWidget {
  final QuotaOverview quota;
  final bool showIcon;
  final bool showStatusBadge;
  final bool showCreditValue;
  final String titlePrefix;
  final String? customSegmentText;

  const AppQuotaSummaryCard({
    super.key,
    required this.quota,
    this.showIcon = false,
    this.showStatusBadge = false,
    this.showCreditValue = false,
    this.titlePrefix = 'Cota',
    this.customSegmentText,
  });

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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (showIcon) ...[
                    Icon(
                      _getIconForCategory(quota.category),
                      size: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    titlePrefix == 'Cota' ? quota.title : titlePrefix,
                    style: TextStyle(
                      color: titlePrefix == 'Cota selecionada'
                          ? AppColors.textSecondary
                          : AppColors.textPrimary,
                      fontSize: titlePrefix == 'Cota selecionada' ? 12 : 14,
                      fontWeight: titlePrefix == 'Cota selecionada'
                          ? FontWeight.w400
                          : FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (showStatusBadge)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                      color: AppColors.primary.withAlpha(50),
                    ),
                  ),
                  child: const Text(
                    'Ativa',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: AppColors.textDisabled,
                        fontSize: 12,
                      ),
                      children: [
                        const TextSpan(text: 'Grupo '),
                        TextSpan(
                          text: quota.group,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: '   Cota '),
                        TextSpan(
                          text: quota.number,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (customSegmentText != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      customSegmentText!,
                      style: const TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
              if (showCreditValue)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Carta de crédito',
                      style: TextStyle(
                        color: AppColors.textDisabled,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      quota.creditValue,
                      style: const TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
