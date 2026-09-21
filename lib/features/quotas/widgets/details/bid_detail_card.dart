import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class BidDetailCard extends StatelessWidget {
  const BidDetailCard({required this.onPressed, super.key});

  final VoidCallback onPressed;

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
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BidIcon(),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lance',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Nenhum lance ativo',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Prazo até 24 de setembro, às 18h',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
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
