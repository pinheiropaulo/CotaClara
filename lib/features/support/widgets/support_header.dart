import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SupportHeader extends StatelessWidget {
  const SupportHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.forum_outlined, color: AppColors.accentBlue, size: 48),
        SizedBox(height: 16),
        Text(
          'Como podemos ajudar?',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Você será direcionado para a Central de Atendimento pelo WhatsApp.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
