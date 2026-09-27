import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FinancialCard extends StatelessWidget {
  final bool showValues;
  final VoidCallback onToggleValues;

  const FinancialCard({
    super.key,
    required this.showValues,
    required this.onToggleValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x6633414C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Carta de crédito contemplada',
                style: TextStyle(
                  color: AppColors.accentBlue,
                  fontSize: 14,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  showValues
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
                onPressed: onToggleValues,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            showValues ? 'R\$ 80.000,00' : 'R\$ ••••••••',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Contemplada em 25 de setembro de 2026',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.accentBlue,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  'Crédito disponível para análise',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
