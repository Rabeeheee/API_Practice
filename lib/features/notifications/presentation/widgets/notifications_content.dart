import 'package:flutter/material.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification.dart';
import 'package:grocery_app/features/notifications/presentation/utils/notification_grouper.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/notification_item.dart';

class NotificationsContent extends StatelessWidget {
  final List<NotificationEntity> notifications;
  final Future<void> Function() onRefresh;
  final Function(NotificationEntity) onNotificationTap;

  const NotificationsContent({
    super.key,
    required this.notifications,
    required this.onRefresh,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    // Group notifications by date
    final groupedNotifications = NotificationGrouper.groupByDate(notifications);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: groupedNotifications.length,
        itemBuilder: (context, index) {
          final date = groupedNotifications.keys.elementAt(index);
          final dateNotifications = groupedNotifications[date]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ...dateNotifications.map((notification) {
                return NotificationItem(
                  notification: notification,
                  onTap: () => onNotificationTap(notification),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
