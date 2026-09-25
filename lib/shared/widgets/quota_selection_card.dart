import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuotaSelectionCard extends StatelessWidget {
  const QuotaSelectionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
    this.status = 'Ativa',
    this.showSelectionControl = true,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final String status;
  final VoidCallback onPressed;
  final bool showSelectionControl;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.surfaceElevated,
                child: Icon(icon, color: AppColors.accentBlue, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _ActiveBadge(label: status),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (showSelectionControl)
                const Icon(
                  Icons.unfold_more,
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

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.success,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
