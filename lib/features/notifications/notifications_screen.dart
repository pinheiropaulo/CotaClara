import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/notifications/models/notification_item.dart';
import 'package:cota_clara/features/notifications/widgets/notification_filters_bar.dart';
import 'package:cota_clara/features/notifications/widgets/notifications_group_list.dart';
import 'package:cota_clara/features/notifications/widgets/notifications_header_info.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationGroup>? _notifications;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final n = await MockApi.instance.getNotifications();
    if (mounted) {
      setState(() {
        _notifications = n;
      });
    }
  }

  String _selectedFilter = 'Tudo';

  void _markAllAsRead() {
    _showComingSoon('Marcar todas como lidas');
  }

  int get _unreadCount {
    if (_notifications == null) return 0;
    return _notifications!.fold(
      0,
      (total, group) =>
          total +
          group.items
              .where((i) => i.status == NotificationStatus.unread)
              .length,
    );
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
    if (_notifications == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
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
                      NotificationsHeaderInfo(
                        unreadCount: _unreadCount,
                        onMarkAllAsRead: _markAllAsRead,
                      ),
                      const SizedBox(height: 24),
                      NotificationFiltersBar(
                        selectedFilter: _selectedFilter,
                        onFilterSelected: (val) =>
                            setState(() => _selectedFilter = val),
                      ),
                      const SizedBox(height: 24),
                      NotificationsGroupList(
                        notifications: _notifications!,
                        selectedFilter: _selectedFilter,
                        onShowComingSoon: _showComingSoon,
                      ),
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
}
