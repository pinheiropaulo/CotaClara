import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class QuotasHeader extends StatelessWidget {
  const QuotasHeader({required this.onNotificationsPressed, super.key});

  final VoidCallback onNotificationsPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.surface,
                child: Icon(
                  Icons.person,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'CotaClara',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _NotificationButton(onPressed: onNotificationsPressed),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minhas cotas',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Acompanhe seus planos em um só lugar',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          tooltip: 'Notificações',
          onPressed: onPressed,
          style: IconButton.styleFrom(
            fixedSize: const Size(40, 40),
            backgroundColor: AppColors.surface,
            side: const BorderSide(color: AppColors.border),
          ),
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.accentBlue,
            size: 20,
          ),
        ),
        const Positioned(
          top: 8,
          right: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.accentBlue,
              shape: BoxShape.circle,
            ),
            child: SizedBox(width: 8, height: 8),
          ),
        ),
      ],
    );
  }
}
