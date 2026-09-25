import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VehicleInstallmentCard extends StatelessWidget {
  const VehicleInstallmentCard({
    required this.onPayPressed,
    required this.onViewAllPressed,
    super.key,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Próxima\nparcela',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _InstallmentBadges(),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vencimento em',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '10 de outubro de 2026',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'R\$ 842,36',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: onPayPressed,
              icon: const Icon(Icons.receipt_long_outlined, size: 20),
              label: const Text('Pagar boleto'),
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onViewAllPressed,
            label: const Text('Ver todas as parcelas'),
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.chevron_right, size: 17),
          ),
        ],
      ),
    );
  }
}

class _InstallmentBadges extends StatelessWidget {
  const _InstallmentBadges();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _Badge(label: 'Pendente'),
        SizedBox(height: 5),
        _Badge(label: 'Valor com ajuste de\nentrada', highlighted: true),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, this.highlighted = false});

  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.onPrimary : AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: highlighted ? AppColors.primary : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: highlighted ? AppColors.primary : AppColors.accentBlue,
          fontSize: 10,
          height: 1.2,
        ),
      ),
    );
  }
}
