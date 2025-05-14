import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/notifications_content.dart';
// Import with aliases to avoid naming conflicts
import 'package:grocery_app/features/notifications/presentation/widgets/notifications_error.dart' as error_widget;
import 'package:grocery_app/features/notifications/presentation/widgets/notifications_loading.dart' as loading_widget;

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              if (state is NotificationsLoaded && 
                  state.notifications.any((notification) => !notification.isRead)) {
                return IconButton(
                  icon: const Icon(Icons.done_all),
                  onPressed: () {
                    context.read<NotificationsBloc>().add(
                          MarkAllNotificationsAsReadEvent(),
                        );
                  },
                  tooltip: 'Mark all as read',
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            // Use prefixed widget to disambiguate from bloc state
            return const loading_widget.NotificationsLoading();
          } else if (state is NotificationsLoaded) {
            if (state.notifications.isEmpty) {
              return const Center(
                child: Text('No notifications'),
              );
            }
            
            return NotificationsContent(
              notifications: state.notifications,
              onRefresh: () async {
                context.read<NotificationsBloc>().add(FetchNotificationsEvent());
              },
              onNotificationTap: (notification) {
                if (!notification.isRead) {
                  context.read<NotificationsBloc>().add(
                        MarkNotificationAsReadEvent(id: notification.id),
                      );
                }
                // Handle notification tap
                if (notification.actionUrl != null) {
                  // Navigate to action URL
                }
              },
            );
          } else if (state is NotificationsError) {
            // Use prefixed widget to disambiguate from bloc state
            return error_widget.NotificationsError(
              message: state.message,
              onRetry: () {
                context.read<NotificationsBloc>().add(FetchNotificationsEvent());
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}