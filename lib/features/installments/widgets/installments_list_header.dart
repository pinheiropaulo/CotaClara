import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InstallmentsListHeader extends StatelessWidget {
  const InstallmentsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Todas as parcelas',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'Mais recentes primeiro',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
