import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';

class ContractDocumentsCard extends StatelessWidget {
  const ContractDocumentsCard({
    required this.onContractPressed,
    required this.onRegulationPressed,
    super.key,
  });

  final VoidCallback onContractPressed;
  final VoidCallback onRegulationPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'CONTRATO E REGULAMENTO',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _DocumentTile(
                icon: Icons.picture_as_pdf_outlined,
                title: 'Contrato da cota',
                subtitle: 'Consulte o documento contratado',
                trailingIcon: Icons.chevron_right,
                onPressed: onContractPressed,
              ),
              const Divider(height: 1, color: AppColors.border),
              _DocumentTile(
                icon: Icons.language,
                title: 'Regulamento do grupo',
                subtitle: 'Consulte a versão atual online',
                trailingIcon: Icons.open_in_new,
                onPressed: onRegulationPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DocumentTile extends StatelessWidget {
  const _DocumentTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 21),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(trailingIcon, color: AppColors.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
