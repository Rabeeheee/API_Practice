import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/pages/home_page.dart';
import 'package:grocery_app/features/notifications/presentation/pages/notifications_pages.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String notificationsRoute = '/notifications';

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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }
}
