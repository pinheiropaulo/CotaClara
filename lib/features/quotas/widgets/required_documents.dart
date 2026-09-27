import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/widgets/credit_release_widgets.dart';
import 'package:flutter/material.dart';

class RequiredDocuments extends StatelessWidget {
  final Function(String) onAction;

  const RequiredDocuments({super.key, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'O que falta enviar',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        DocumentItem(
          icon: Icons.badge,
          title: 'Documento de identificação',
          status: 'Pendente',
          onPressed: () => onAction('Enviar documento'),
        ),
        const SizedBox(height: 12),
        DocumentItem(
          icon: Icons.location_on_outlined,
          title: 'Comprovante de endereço',
          status: 'Pendente',
          onPressed: () => onAction('Enviar comprovante'),
        ),
        const SizedBox(height: 12),
        DocumentItem(
          icon: Icons.apartment,
          title: 'Dados do imóvel',
          status: 'Não informado',
          onPressed: () => onAction('Informar dados'),
        ),
        const SizedBox(height: 16),
        const Text(
          'Os documentos necessários podem variar conforme o bem e as regras da administradora.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
