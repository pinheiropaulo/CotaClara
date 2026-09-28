import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class UpcomingDueSection extends StatelessWidget {
  const UpcomingDueSection({
    required this.quotas,
    required this.onViewAllPressed,
    required this.onDuePressed,
    super.key,
  });

  final List<QuotaOverview> quotas;
  final VoidCallback onViewAllPressed;
  final ValueChanged<String> onDuePressed;

  @override
  Widget build(BuildContext context) {
    if (quotas.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Próximos vencimentos',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: onViewAllPressed,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.accentBlue,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Ver todos',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              for (var index = 0; index < quotas.length; index++) ...[
                _UpcomingDueItem(
                  quota: quotas[index],
                  onPressed: () => onDuePressed(quotas[index].id),
                ),
                if (index < quotas.length - 1)
                  const Divider(height: 1, color: AppColors.border),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _UpcomingDueItem extends StatelessWidget {
  const _UpcomingDueItem({
    required this.quota,
    required this.onPressed,
  });

  final QuotaOverview quota;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final (statusColor, statusBackground) = _statusColors(
      quota.nextInstallmentStatus,
    );
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _iconFor(quota.category),
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quota.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${quota.dueDate} · ${quota.installmentValue}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _StatusBadge(
              label: quota.nextInstallmentStatus,
              foregroundColor: statusColor,
              backgroundColor: statusBackground,
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              color: AppColors.accentBlue,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(QuotaCategory category) => switch (category) {
    QuotaCategory.property => Icons.home_outlined,
    QuotaCategory.vehicle => Icons.directions_car_outlined,
    QuotaCategory.services => Icons.handyman_outlined,
  };

  (Color, Color) _statusColors(String status) => switch (status) {
    'Em aberto' => (AppColors.accentBlue, const Color(0xFF1D4054)),
    'Em atraso' => (AppColors.error, AppColors.errorContainer),
    'Em análise' => (AppColors.warning, AppColors.warningContainer),
    _ => (AppColors.warning, AppColors.warningContainer),
  };
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final String label;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
