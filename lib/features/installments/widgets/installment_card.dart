import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/installments/models/installment.dart';
import 'package:flutter/material.dart';

class InstallmentCard extends StatelessWidget {
  const InstallmentCard({
    required this.installment,
    required this.onPressed,
    super.key,
  });

  final Installment installment;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final overdue = installment.status == InstallmentStatus.overdue;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      installment.month,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Parcela ${installment.number} de ${installment.total}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(status: installment.status),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: AppColors.border),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      installment.valueLabel,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      installment.value,
                      style: TextStyle(
                        color: overdue
                            ? AppColors.error
                            : AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (installment.status == InstallmentStatus.paid) ...[
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.success,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Flexible(
                      child: Text(
                        installment.dateLabel,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Divider(height: 1, color: AppColors.border),
          ),
          InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    _actionIcon,
                    color: AppColors.accentBlue,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      installment.actionLabel,
                      style: const TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.accentBlue,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData get _actionIcon => switch (installment.status) {
    InstallmentStatus.pending => Icons.receipt_long_outlined,
    InstallmentStatus.paid => Icons.description_outlined,
    InstallmentStatus.overdue => Icons.sync,
  };
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final InstallmentStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color, background, icon) = switch (status) {
      InstallmentStatus.pending => (
        'Pendente',
        AppColors.warning,
        AppColors.warningContainer,
        null,
      ),
      InstallmentStatus.paid => (
        'Paga',
        AppColors.success,
        AppColors.successContainer,
        null,
      ),
      InstallmentStatus.overdue => (
        'Vencida',
        AppColors.error,
        AppColors.errorContainer,
        Icons.error_outline,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color, size: 14),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
