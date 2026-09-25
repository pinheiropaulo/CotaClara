import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PlanProgressCard extends StatelessWidget {
  const PlanProgressCard({
    this.headline = '42 de 180 parcelas',
    this.progressLabel = '23% concluído',
    this.progress = 0.23,
    this.paidValue = 'Valor pago: R\$ 19.840,00',
    this.remaining = 'Restam 138 parcelas',
    super.key,
  });

  final String headline;
  final String progressLabel;
  final double progress;
  final String paidValue;
  final String remaining;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progresso do plano',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  headline,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _ProgressBadge(label: progressLabel),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              color: AppColors.primary,
              backgroundColor: AppColors.border,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  paidValue,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                remaining,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressBadge extends StatelessWidget {
  const _ProgressBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.success,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
