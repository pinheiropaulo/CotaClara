import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BidDetailCard extends StatelessWidget {
  const BidDetailCard({
    required this.onPressed,
    this.deadline = 'Prazo até 24 de setembro, às 18h',
    this.deadlineOnTrailing = false,
    super.key,
  });

  final VoidCallback onPressed;
  final String deadline;
  final bool deadlineOnTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BidIcon(),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lance',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Nenhum lance ativo',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (!deadlineOnTrailing) ...[
                      const SizedBox(height: 2),
                      Text(
                        deadline,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (deadlineOnTrailing)
                SizedBox(
                  width: 112,
                  child: Text(
                    deadline,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      height: 1.2,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('Ofertar lance'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.accentBlue,
                backgroundColor: AppColors.surfaceElevated,
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BidIcon extends StatelessWidget {
  const _BidIcon();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(
          Icons.gavel_outlined,
          color: AppColors.accentBlue,
          size: 21,
        ),
      ),
    );
  }
}
