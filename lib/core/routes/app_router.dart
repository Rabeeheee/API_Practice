import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/pages/home_page.dart';
import 'package:grocery_app/features/notifications/presentation/pages/notifications_page.dart';

class AppRouter {
  // Routes
  static const String homeRoute = '/';
  static const String notificationsRoute = '/notifications';
  
  // Add other routes here
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
        
      case notificationsRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
        );
        
      // Add other routes here
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}