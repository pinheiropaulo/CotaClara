import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/notifications/data/mock_notifications.dart';
import 'package:cota_clara/features/notifications/models/notification_item.dart';
import 'package:cota_clara/features/notifications/widgets/notification_card.dart';
import 'package:cota_clara/features/notifications/widgets/notification_filters_bar.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<NotificationGroup> _groups;
  String _selectedFilter = 'Todas';

  @override
  void initState() {
    super.initState();
    _groups = List.from(mockNotifications);
  }

  int get _unreadCount {
    int count = 0;
    for (final group in _groups) {
      count += group.items
          .where((i) => i.status == NotificationStatus.unread)
          .length;
    }
    return count;
  }

  void _markAllAsRead() {
    setState(() {
      _groups = _groups.map((group) {
        return NotificationGroup(
          title: group.title,
          items: group.items.map((item) {
            return item.copyWith(status: NotificationStatus.read);
          }).toList(),
        );
      }).toList();
    });
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    children: [
                      _buildHeaderInfo(),
                      const SizedBox(height: 24),
                      NotificationFiltersBar(
                        selectedFilter: _selectedFilter,
                        onFilterSelected: (val) =>
                            setState(() => _selectedFilter = val),
                      ),
                      const SizedBox(height: 24),
                      ..._buildGroupList(),
                      const SizedBox(height: 32),
                      const Center(
                        child: Text(
                          'Você viu todas as notificações recentes',
                          style: TextStyle(
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
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return AppTaskTopBar(
      title: 'Notificações',
      onBackPressed: () => context.pop(),
      onHelpPressed: _markAllAsRead,
      helpTooltip: 'Marcar todas como lidas',
      trailingIcon: Icons.done_all,
    );
  }

  Widget _buildHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$_unreadCount notificações não lidas',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (_unreadCount > 0)
          TextButton(
            onPressed: _markAllAsRead,
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

  List<Widget> _buildGroupList() {
    final List<Widget> widgets = [];
    for (final group in _groups) {
      final items = group.items.where((item) {
        if (_selectedFilter == 'Não lidas') {
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
              onPressed: () => _showComingSoon('Detalhes da notificação'),
            ),
          );
        }
      }
    }
    return widgets;
  }
}
