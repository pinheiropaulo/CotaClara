import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatementPeriodSummary extends StatelessWidget {
  const StatementPeriodSummary({
    super.key,
    required this.showValues,
    required this.onToggleValues,
  });

  final bool showValues;
  final VoidCallback onToggleValues;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Pagamentos no período',
                  style: TextStyle(
                    color: AppColors.accentBlue,
                    fontSize: 14,
                  ),
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
          const SizedBox(height: 8),
          Text(
            showValues ? 'R\$ 4.176,70' : 'R\$ ••••••••',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '5 pagamentos confirmados',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
