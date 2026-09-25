import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyDetailCard extends StatelessWidget {
  const AssemblyDetailCard({
    required this.onPressed,
    this.date = '25 de setembro • 19h',
    super.key,
  });

  final VoidCallback onPressed;
  final String date;

  @override
  Widget build(BuildContext context) {
    return _SurfaceTile(
      icon: Icons.calendar_month_outlined,
      title: 'Próxima assembleia',
      subtitle: date,
      trailing: TextButton(
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ver detalhes'),
            Icon(Icons.chevron_right, size: 18),
          ],
        ),
      ),
      badge: const _ScheduledBadge(),
    );
  }
}

class _SurfaceTile extends StatelessWidget {
  const _SurfaceTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.badge,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (badge != null) ...[
                      const SizedBox(width: 8),
                      badge!,
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _ScheduledBadge extends StatelessWidget {
  const _ScheduledBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          'Agendada',
          style: TextStyle(color: AppColors.success, fontSize: 11),
        ),
      ),
    );
  }
}
