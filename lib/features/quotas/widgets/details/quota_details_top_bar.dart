import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuotaDetailsTopBar extends StatelessWidget {
  const QuotaDetailsTopBar({
    required this.onBackPressed,
    required this.onMorePressed,
    this.onHelpPressed,
    super.key,
  });

  final VoidCallback onBackPressed;
  final VoidCallback onMorePressed;
  final VoidCallback? onHelpPressed;

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: 'Voltar',
                onPressed: onBackPressed,
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.accentBlue,
                ),
              ),
              if (onHelpPressed != null) const SizedBox(width: 48),
            ],
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onHelpPressed != null)
                IconButton(
                  tooltip: 'Ajuda',
                  onPressed: onHelpPressed,
                  icon: const Icon(
                    Icons.help_outline,
                    color: AppColors.accentBlue,
                  ),
                ),
              IconButton(
                tooltip: 'Mais opções',
                onPressed: onMorePressed,
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.accentBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
