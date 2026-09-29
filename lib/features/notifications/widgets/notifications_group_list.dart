import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/notifications/models/notification_item.dart';
import 'package:cota_clara/features/notifications/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationsGroupList extends StatelessWidget {
  final List<NotificationGroup> notifications;
  final String selectedFilter;
  final void Function(String) onShowComingSoon;

  const NotificationsGroupList({
    super.key,
    required this.notifications,
    required this.selectedFilter,
    required this.onShowComingSoon,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    for (final group in notifications) {
      final items = group.items.where((item) {
        if (selectedFilter == 'Não lidas') {
          return item.status == NotificationStatus.unread;
        }
        return true;
      }).toList();

      if (items.isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              group.title,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );

        for (final item in items) {
          widgets.add(
            NotificationCard(
              item: item,
              onPressed: () => onShowComingSoon('Detalhes da notificação'),
            ),
          );
        }
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }
}
