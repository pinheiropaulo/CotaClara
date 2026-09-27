import 'package:flutter/material.dart';

enum NotificationStatus { unread, read }

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.quotaContext,
    required this.timeLabel,
    required this.icon,
    this.status = NotificationStatus.unread,
  });

  final String id;
  final String title;
  final String description;
  final String quotaContext;
  final String timeLabel;
  final IconData icon;
  final NotificationStatus status;

  NotificationItem copyWith({NotificationStatus? status}) {
    return NotificationItem(
      id: id,
      title: title,
      description: description,
      quotaContext: quotaContext,
      timeLabel: timeLabel,
      icon: icon,
      status: status ?? this.status,
    );
  }
}

class NotificationGroup {
  const NotificationGroup({
    required this.title,
    required this.items,
  });

  final String title;
  final List<NotificationItem> items;
}
