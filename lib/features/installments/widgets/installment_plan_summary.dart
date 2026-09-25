import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InstallmentPlanSummary extends StatelessWidget {
  const InstallmentPlanSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Resumo do plano',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _ProgressBadge(),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  '42 de 180 parcelas pagas',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '138 restantes',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(99)),
            child: LinearProgressIndicator(
              value: 0.23,
              minHeight: 8,
              color: AppColors.primary,
              backgroundColor: AppColors.border,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBadge extends StatelessWidget {
  const _ProgressBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          '23% concluído',
          style: TextStyle(
            color: AppColors.success,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
