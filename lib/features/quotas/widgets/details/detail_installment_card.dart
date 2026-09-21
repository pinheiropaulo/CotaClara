import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class DetailInstallmentCard extends StatelessWidget {
  const DetailInstallmentCard({
    required this.onPayPressed,
    required this.onViewAllPressed,
    super.key,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: ColoredBox(
                color: AppColors.primary,
                child: SizedBox(width: 4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: _InstallmentContent(
                onPayPressed: onPayPressed,
                onViewAllPressed: onViewAllPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstallmentContent extends StatelessWidget {
  const _InstallmentContent({
    required this.onPayPressed,
    required this.onViewAllPressed,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                'Próxima parcela',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _PendingBadge(),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'R\$ 842,50',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: AppColors.accentBlue,
              size: 18,
            ),
            SizedBox(width: 6),
            Text(
              'Vencimento em 15 de setembro',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
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
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: onViewAllPressed,
            child: const Text('Ver todas as parcelas'),
          ),
        ),
      ],
    );
  }
}

class _PendingBadge extends StatelessWidget {
  const _PendingBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.warningContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          'Pendente',
          style: TextStyle(color: AppColors.warning, fontSize: 12),
        ),
      ),
    );
  }
}
