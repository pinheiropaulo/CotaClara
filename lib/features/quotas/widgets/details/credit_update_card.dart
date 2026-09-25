import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/widgets/details/credit_update_parts.dart';
import 'package:flutter/material.dart';

class CreditUpdateCard extends StatelessWidget {
  const CreditUpdateCard({
    required this.onInfoPressed,
    this.growth = '+5,35%',
    this.contractedValue = 'R\$ 80.000,00',
    this.currentValue = 'R\$ 84.280,00',
    this.accumulatedValue = '+ R\$ 4.280,00',
    this.lastUpdate = '1 de setembro de 2026',
    super.key,
  });

  final VoidCallback onInfoPressed;
  final String growth;
  final String contractedValue;
  final String currentValue;
  final String accumulatedValue;
  final String lastUpdate;

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
              CreditGrowthBadge(value: growth),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CreditUpdateValueBox(
                  label: 'Valor contratado',
                  value: contractedValue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CreditUpdateValueBox(
                  label: 'Valor atual da carta',
                  value: currentValue,
                  highlighted: true,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: AppColors.border),
          ),
          Row(
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
                accumulatedValue,
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
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
                lastUpdate,
                style: const TextStyle(
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
