import 'package:intl/intl.dart';

class NotificationGrouper {
  static Map<String, List<dynamic>> groupByDate(List<dynamic> notifications) {
    final Map<String, List<dynamic>> grouped = {};
    
    for (var notification in notifications) {
      final date = _formatDate(notification.timestamp);
      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(notification);
    }
    
    return grouped;
  }

  static String _formatDate(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final notificationDate = DateTime(date.year, date.month, date.day);
    
    if (notificationDate == DateTime(now.year, now.month, now.day)) {
      return 'Today';
    } else if (notificationDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, y').format(date);
    }
  }
}
