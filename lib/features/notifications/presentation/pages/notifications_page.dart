import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_event.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_state.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/custom_appbar.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/empty_notification.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/notification_error.dart';
import 'package:grocery_app/features/notifications/presentation/widgets/notification_item.dart';
import 'package:grocery_app/core/di/injection_container.dart' as di;

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<NotificationsBloc>()..add(GetNotificationsEvent()),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NotificationsLoaded) {
              if (state.notifications.isEmpty) {
                return EmptyNotification();
              }
              // REFRESH INDICATIOR
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NotificationsBloc>().add(GetNotificationsEvent());
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.notifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return NotificationItem(notification: notification);
                  },
                ),
              );
            } else if (state is NotificationsError) {
              return NotificationError(message: state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
  
  
  
  
}

