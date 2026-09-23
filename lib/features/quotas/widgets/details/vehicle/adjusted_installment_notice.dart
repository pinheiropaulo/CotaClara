import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';

class AdjustedInstallmentNotice extends StatelessWidget {
  const AdjustedInstallmentNotice({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.financialCard,
            child: Icon(
              Icons.info_outline,
              color: AppColors.accentBlue,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Parcela ajustada',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Você entrou em um grupo em andamento. O valor mensal já '
                  'considera o ajuste referente às parcelas anteriores do grupo.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 32),
                  ),
                  label: const Text('Entenda o ajuste'),
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.chevron_right, size: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
