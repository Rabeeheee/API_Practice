import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/core/utils/isolate_parser.dart';
import 'package:grocery_app/features/notifications/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<bool> markAsRead(String id);
  Future<bool> markAllAsRead();
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final http.Client client;
  final String apiUrl = 'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';

  NotificationsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await client.get(Uri.parse(apiUrl));
      
      if (response.statusCode == 200) {
        // Use isolate for JSON parsing to avoid blocking the main thread
        final jsonData = await IsolateParser.parseJsonInIsolate(response.body);
        
        if (jsonData['notifications'] != null) {
          return List<NotificationModel>.from(
            jsonData['notifications'].map(
              (notification) => NotificationModel.fromJson(notification),
            ),
          );
        }
        return [];
      } else {
        throw ServerException(message: 'Failed to load notifications');
      }
    } catch (e) {
      throw ServerException(message: 'Error fetching notifications: ${e.toString()}');
    }
  }

  @override
  Future<bool> markAsRead(String id) async {
    // In a real app, this would make an API call to mark a notification as read
    // For this example, we'll just return true
    return true;
  }

  @override
  Future<bool> markAllAsRead() async {
    // In a real app, this would make an API call to mark all notifications as read
    // For this example, we'll just return true
    return true;
  }
}
