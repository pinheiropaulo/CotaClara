import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/widgets/credit_release_widgets.dart';
import 'package:flutter/material.dart';

class ReleaseSteps extends StatelessWidget {
  const ReleaseSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Etapas da liberação',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        StepItem(
          icon: Icons.check_circle,
          iconColor: AppColors.success,
          title: 'Contemplação',
          subtitle: 'Concluída em 25 set. 2026',
          isLast: false,
        ),
        StepItem(
          icon: Icons.description,
          iconColor: AppColors.warning,
          title: 'Documentação',
          subtitle: 'Envio pendente',
          isLast: false,
        ),
        StepItem(
          icon: Icons.find_in_page,
          iconColor: AppColors.textSecondary,
          title: 'Análise',
          subtitle: 'Aguardando documentação',
          isLast: false,
        ),
        StepItem(
          icon: Icons.verified,
          iconColor: AppColors.textSecondary,
          title: 'Liberação',
          subtitle: 'Após aprovação',
          isLast: true,
        ),
      ],
    );
  }
}
