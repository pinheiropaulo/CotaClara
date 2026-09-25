import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyDetailsHeaderCard extends StatelessWidget {
  const AssemblyDetailsHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _IconContainer(icon: Icons.calendar_today_outlined),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Assembleia mensal',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
              _ResultAvailableBadge(),
            ],
          ),
          SizedBox(height: 12),
          Divider(height: 1, color: AppColors.border),
          SizedBox(height: 14),
          Text(
            'Assembleia de setembro',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '25 de setembro de 2026 • 19h',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColors.accentBlue, size: 16),
    );
  }
}

class _ResultAvailableBadge extends StatelessWidget {
  const _ResultAvailableBadge();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Resultado disponível',
          style: TextStyle(color: AppColors.success, fontSize: 11),
        ),
      ),
    );
  }
}
