import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DetailInstallmentCard extends StatelessWidget {
  const DetailInstallmentCard({
    required this.onPayPressed,
    required this.onViewAllPressed,
    required this.value,
    required this.dueDate,
    required this.status,
    super.key,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewAllPressed;
  final String value;
  final String dueDate;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: _InstallmentContent(
          onPayPressed: onPayPressed,
          onViewAllPressed: onViewAllPressed,
          value: value,
          dueDate: dueDate,
          status: status,
        ),
      ),
    );
  }
}

class _InstallmentContent extends StatelessWidget {
  const _InstallmentContent({
    required this.onPayPressed,
    required this.onViewAllPressed,
    required this.value,
    required this.dueDate,
    required this.status,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewAllPressed;
  final String value;
  final String dueDate;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            _PendingBadge(label: status),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.accentBlue,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              'Vencimento em $dueDate',
              style: const TextStyle(
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
  const _PendingBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.warningContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: const TextStyle(color: AppColors.warning, fontSize: 12),
        ),
      ),
    );
  }
}
