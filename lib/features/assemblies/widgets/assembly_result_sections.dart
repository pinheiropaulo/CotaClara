import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyResultSummary extends StatelessWidget {
  const AssemblyResultSummary({
    required this.onViewContemplatedPressed,
    super.key,
  });

  final VoidCallback onViewContemplatedPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESUMO DO RESULTADO',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              const _SummaryRow(
                label: 'Cotas contempladas por sorteio',
                value: '3 cotas',
              ),
              const Divider(height: 1, color: AppColors.border),
              const _SummaryRow(
                label: 'Cotas contempladas por lance',
                value: '7 cotas',
              ),
              const Divider(height: 1, color: AppColors.border),
              const _SummaryRow(
                label: 'Total de contemplações',
                value: '10 cotas',
                isHighlighted: true,
              ),
              const Divider(height: 1, color: AppColors.border),
              const _DrawnNumberRow(),
              InkWell(
                onTap: onViewContemplatedPressed,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Ver lista completa de contemplados',
                          style: TextStyle(
                            color: AppColors.accentBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, color: AppColors.accentBlue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  final String label;
  final String value;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isHighlighted ? AppColors.surfaceElevated : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isHighlighted
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isHighlighted
                  ? AppColors.accentBlue
                  : AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawnNumberRow extends StatelessWidget {
  const _DrawnNumberRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Número sorteado',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '3215',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssemblyDocumentsCard extends StatelessWidget {
  const AssemblyDocumentsCard({
    required this.onMinutesPressed,
    required this.onRulesPressed,
    super.key,
  });

  final VoidCallback onMinutesPressed;
  final VoidCallback onRulesPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DOCUMENTOS DA ASSEMBLEIA',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _DocumentItem(
                icon: Icons.description_outlined,
                title: 'Ata da assembleia',
                subtitle: 'PDF oficial do encerramento',
                trailingIcon: Icons.download_outlined,
                onPressed: onMinutesPressed,
              ),
              const Divider(height: 1, color: AppColors.border),
              _DocumentItem(
                icon: Icons.gavel_outlined,
                title: 'Regras do grupo',
                subtitle: 'Consulte os critérios de contemplação',
                trailingIcon: Icons.chevron_right,
                onPressed: onRulesPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DocumentItem extends StatelessWidget {
  const _DocumentItem({
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.accentBlue, size: 21),
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
                  const SizedBox(height: 3),
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
            Icon(trailingIcon, color: AppColors.accentBlue),
          ],
        ),
      ),
    );
  }
}
