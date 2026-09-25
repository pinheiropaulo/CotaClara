import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class QuotaStatusBadge extends StatelessWidget {
  const QuotaStatusBadge({required this.status, super.key});

  final QuotaStatus status;

  @override
  Widget build(BuildContext context) {
    final isActive = status == QuotaStatus.active;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.successContainer
            : AppColors.warningContainer,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          isActive ? 'Ativa' : 'Em análise',
          style: TextStyle(
            color: isActive ? AppColors.success : AppColors.warning,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
