import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QuotaDetailsTopBar extends StatelessWidget {
  const QuotaDetailsTopBar({
    required this.onBackPressed,
    required this.onMorePressed,
    super.key,
  });

  final VoidCallback onBackPressed;
  final VoidCallback onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.canvas,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Voltar',
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back, color: AppColors.accentBlue),
          ),
          const Expanded(
            child: Text(
              'Detalhes da cota',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Mais opções',
            onPressed: onMorePressed,
            icon: const Icon(Icons.more_vert, color: AppColors.accentBlue),
          ),
        ],
      ),
    );
  }
}
