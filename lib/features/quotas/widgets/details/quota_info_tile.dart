import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QuotaInfoTile extends StatelessWidget {
  const QuotaInfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.informationOnly = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool informationOnly;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.accentBlue, size: 21),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                informationOnly ? Icons.info_outline : Icons.chevron_right,
                color: AppColors.accentBlue,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
