import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BidQuotaSummary extends StatelessWidget {
  const BidQuotaSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cota de imóvel',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Grupo 012160 • Cota 6503',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'PRÓXIMA ASSEMBLEIA',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '25 de setembro de 2026 • 19h',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Ofertas até 24 de setembro, às 18h',
          style: TextStyle(
            color: AppColors.warning,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Carta de crédito',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'R\$ 80.000,00',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
