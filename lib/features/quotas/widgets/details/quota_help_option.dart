import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QuotaHelpOption extends StatelessWidget {
  const QuotaHelpOption({
    required this.icon,
    required this.title,
    required this.onPressed,
    this.subtitle,
    this.highlighted = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool highlighted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accentColor = highlighted ? AppColors.primary : AppColors.accentBlue;

    return Material(
      color: AppColors.surfaceElevated,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: highlighted ? AppColors.primary : AppColors.border,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 64),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: highlighted
                        ? AppColors.successContainer
                        : AppColors.surface,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: highlighted ? AppColors.primary : AppColors.border,
                    ),
                  ),
                  child: Icon(icon, color: accentColor, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: highlighted
                              ? AppColors.primary
                              : AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: accentColor, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
