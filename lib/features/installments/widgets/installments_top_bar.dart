import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class InstallmentsTopBar extends StatelessWidget {
  const InstallmentsTopBar({
    required this.onBackPressed,
    required this.onHelpPressed,
    super.key,
  });

  final VoidCallback onBackPressed;
  final VoidCallback onHelpPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Voltar',
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back, color: AppColors.accentBlue),
          ),
          const Expanded(
            child: Text(
              'Parcelas',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Ajuda e orientações',
            onPressed: onHelpPressed,
            icon: const Icon(
              Icons.help_outline,
              color: AppColors.accentBlue,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
