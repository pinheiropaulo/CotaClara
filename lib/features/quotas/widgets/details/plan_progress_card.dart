import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PlanProgressCard extends StatelessWidget {
  const PlanProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progresso do plano',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  '42 de 180 parcelas',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _ProgressBadge(),
            ],
          ),
          SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(99)),
            child: LinearProgressIndicator(
              value: 0.23,
              minHeight: 10,
              color: AppColors.primary,
              backgroundColor: AppColors.border,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Valor pago: R\$ 19.840,00',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                'Restam 138 parcelas',
                style: TextStyle(
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
