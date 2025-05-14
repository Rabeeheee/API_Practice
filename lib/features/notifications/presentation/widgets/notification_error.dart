import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_event.dart';

class NotificationError extends StatelessWidget {

    final String message;
    
  const NotificationError({super.key, required this.message});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 60,
            color: Colors.red[300],
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<NotificationsBloc>().add(GetNotificationsEvent());
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}