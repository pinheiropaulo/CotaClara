import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class SupportQuotaSection extends StatelessWidget {
  final QuotaOverview? selectedQuota;

  const SupportQuotaSection({super.key, this.selectedQuota});

  @override
  Widget build(BuildContext context) {
    if (selectedQuota == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOBRE A SUA COTA',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceElevated,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  selectedQuota?.category == QuotaCategory.vehicle
                      ? Icons.directions_car_outlined
                      : selectedQuota?.category == QuotaCategory.services
                      ? Icons.handyman_outlined
                      : Icons.home_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedQuota!.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Grupo ${selectedQuota!.group}   Cota ${selectedQuota!.number}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
