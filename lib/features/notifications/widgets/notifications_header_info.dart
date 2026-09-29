import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsHeaderInfo extends StatelessWidget {
  final int unreadCount;
  final VoidCallback onMarkAllAsRead;

  const NotificationsHeaderInfo({
    super.key,
    required this.unreadCount,
    required this.onMarkAllAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$unreadCount notificações não lidas',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (unreadCount > 0)
          TextButton(
            onPressed: onMarkAllAsRead,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.accentBlue,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Marcar como lidas',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}
