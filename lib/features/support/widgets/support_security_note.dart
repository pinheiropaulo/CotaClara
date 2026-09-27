import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SupportSecurityNote extends StatelessWidget {
  const SupportSecurityNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.verified_user_outlined,
          color: AppColors.accentBlue,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: const Text(
            'Não enviamos CPF, valores ou outros dados sensíveis nesta mensagem.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
