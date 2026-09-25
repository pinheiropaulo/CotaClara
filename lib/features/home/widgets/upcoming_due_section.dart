import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UpcomingDueSection extends StatelessWidget {
  const UpcomingDueSection({
    required this.onViewAllPressed,
    required this.onDuePressed,
    super.key,
  });

  final VoidCallback onViewAllPressed;
  final ValueChanged<String> onDuePressed;

  @override
  Widget build(BuildContext context) {
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
              _UpcomingDueItem(
                icon: Icons.home_outlined,
                title: 'Cota de imóvel',
                detail: '15 set. · R\$ 842,50',
                status: 'Pendente',
                statusColor: AppColors.warning,
                statusBackground: AppColors.warningContainer,
                onPressed: () => onDuePressed('Cota de imóvel'),
              ),
              const Divider(height: 1, color: AppColors.border),
              _UpcomingDueItem(
                icon: Icons.directions_car_outlined,
                title: 'Consórcio de veículo',
                detail: '10 out. · R\$ 842,36',
                status: 'Em aberto',
                statusColor: AppColors.accentBlue,
                statusBackground: Color(0xFF1D4054),
                onPressed: () => onDuePressed('Consórcio de veículo'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UpcomingDueItem extends StatelessWidget {
  const _UpcomingDueItem({
    required this.icon,
    required this.title,
    required this.detail,
    required this.status,
    required this.statusColor,
    required this.statusBackground,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String detail;
  final String status;
  final Color statusColor;
  final Color statusBackground;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
              child: Icon(icon, color: AppColors.primary, size: 20),
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
                    detail,
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
              label: status,
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
