import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class QuotaIdentityCard extends StatelessWidget {
  const QuotaIdentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final quota = MockApi.instance.currentQuota.value!;

    IconData icon;
    if (quota.category == QuotaCategory.vehicle) {
      icon = Icons.directions_car_outlined;
    } else if (quota.category == QuotaCategory.services) {
      icon = Icons.handyman_outlined;
    } else {
      icon = Icons.home_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.accentBlue,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quota.title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Grupo    Cota ',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _ActiveBadge(status: quota.status),
              const SizedBox(height: 4),
              Text(
                quota.isContemplated ? 'Contemplada' : 'Não contemplada',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge({required this.status});
  final QuotaStatus status;

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.success;
    Color bgColor = AppColors.successContainer;
    String text = 'Ativa';

    if (status == QuotaStatus.underReview) {
      color = AppColors.warning;
      bgColor = AppColors.warningContainer;
      text = 'Em análise';
    } else if (status == QuotaStatus.blocked) {
      color = AppColors.error;
      bgColor = AppColors.errorContainer;
      text = 'Em atraso';
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ),
    );
  }
}
