import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'credit_update_parts.dart';

class CreditUpdateCard extends StatelessWidget {
  const CreditUpdateCard({required this.onInfoPressed, super.key});

  final VoidCallback onInfoPressed;

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
        children: [
          Row(
            children: [
              const Text(
                'Atualização da carta',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                tooltip: 'Informações sobre atualização',
                visualDensity: VisualDensity.compact,
                onPressed: onInfoPressed,
                icon: const Icon(
                  Icons.info_outline,
                  color: AppColors.accentBlue,
                  size: 18,
                ),
              ),
              const Spacer(),
              const CreditGrowthBadge(),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: CreditUpdateValueBox(
                  label: 'Valor contratado',
                  value: 'R\$ 80.000,00',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CreditUpdateValueBox(
                  label: 'Valor atual da carta',
                  value: 'R\$ 84.280,00',
                  highlighted: true,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: AppColors.border),
          ),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Atualização acumulada',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                '+ R\$ 4.280,00',
                style: TextStyle(
                  color: AppColors.success,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Última atualização',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                '1 de setembro de 2026',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const CreditUpdateExplanation(),
        ],
      ),
    );
  }
}
