import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTaskTopBar extends StatelessWidget {
  const AppTaskTopBar({
    required this.title,
    required this.onBackPressed,
    required this.onHelpPressed,
    this.helpTooltip = 'Ajuda',
    this.trailingIcon = Icons.help_outline,
    super.key,
  });

  final String title;
  final VoidCallback onBackPressed;
  final VoidCallback onHelpPressed;
  final String helpTooltip;
  final IconData trailingIcon;

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
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            tooltip: helpTooltip,
            onPressed: onHelpPressed,
            icon: Icon(
              trailingIcon,
              color: AppColors.accentBlue,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
