import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/widgets/credit_release_widgets.dart';
import 'package:flutter/material.dart';

class RequestInfo extends StatelessWidget {
  const RequestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informações da solicitação',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: const Column(
            children: [
              InfoRow(label: 'Tipo de bem', value: 'Imóvel'),
              Divider(color: AppColors.border, height: 24),
              InfoRow(
                label: 'Valor da carta',
                value: 'R\$ 80.000,00',
              ),
              Divider(color: AppColors.border, height: 24),
              InfoRow(
                label: 'Situação',
                value: 'Aguardando documentos',
              ),
              Divider(color: AppColors.border, height: 24),
              InfoRow(
                label: 'Número da solicitação',
                value: 'Ainda não gerado',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
