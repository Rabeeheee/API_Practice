import 'package:grocery_app/core/constants/api_constants.dart';
import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/core/utils/isolate_parser.dart';
import 'package:grocery_app/features/notifications/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final http.Client client;

  NotificationsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.notificationsEndpoint}');
    
    final response = await client.get(url);
    
    if (response.statusCode == 200) {
      // Used isolate parser 
      final jsonData = await IsolateParser.parseJsonInIsolate(response.body);
      
      if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
        final List<dynamic> notificationsJson = jsonData['data'];
        return notificationsJson
            .map((json) => NotificationModel.fromJson(json))
            .toList();
      } else {
        throw ServerException(message: 'Invalid response format');
      }
    } else {
      throw ServerException(message: 'Failed to load notifications');
    }
  }
}