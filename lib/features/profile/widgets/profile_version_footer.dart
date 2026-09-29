import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileVersionFooter extends StatelessWidget {
  const ProfileVersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            'CotaClara',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Versão 1.0.0',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
