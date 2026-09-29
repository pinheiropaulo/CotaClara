import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyInstallments extends StatelessWidget {
  const EmptyInstallments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
        'Nenhuma parcela encontrada neste filtro.',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),
    );
  }
}
