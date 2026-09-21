import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class QuotaIdentityCard extends StatelessWidget {
  const QuotaIdentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.home_outlined,
              color: AppColors.accentBlue,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cota de imóvel',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Grupo 012160 • Cota 6503',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _ActiveBadge(),
              SizedBox(height: 4),
              Text(
                'Não contemplada',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          'Ativa',
          style: TextStyle(color: AppColors.success, fontSize: 12),
        ),
      ),
    );
  }
}
