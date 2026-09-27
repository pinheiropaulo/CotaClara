import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/statement_entry.dart';
import 'package:flutter/material.dart';

class StatementEntryCard extends StatelessWidget {
  const StatementEntryCard({
    super.key,
    required this.entry,
    required this.showValues,
    required this.onPressed,
  });

  final StatementEntry entry;
  final bool showValues;
  final VoidCallback onPressed;

  IconData _getIcon() {
    switch (entry.type) {
      case StatementEntryType.payment:
        return Icons.receipt_long_outlined;
      case StatementEntryType.adjustment:
        return Icons.add_circle_outline;
      case StatementEntryType.refund:
        return Icons.remove_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = entry.type == StatementEntryType.payment
        ? AppColors.success
        : AppColors.warning;
    final statusBgColor = entry.type == StatementEntryType.payment
        ? AppColors.successContainer
        : AppColors.warningContainer;
    final statusText = entry.type == StatementEntryType.payment
        ? 'Confirmado'
        : 'Ajuste';

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: Icon(_getIcon(), color: AppColors.accentBlue, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    entry.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  showValues ? entry.amount : 'R\$ •••••',
                  style: TextStyle(
                    color: entry.isPositive
                        ? AppColors.success
                        : AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
