import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/features/notifications/domain/entities/notification.dart';
import 'package:grocery_app/features/notifications/domain/usecases/get_notifications.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotifications getNotifications;

  NotificationsBloc({required this.getNotifications}) : super(NotificationsInitial()) {
    on<FetchNotificationsEvent>(_onFetchNotifications);
    on<MarkNotificationAsReadEvent>(_onMarkNotificationAsRead);
    on<MarkAllNotificationsAsReadEvent>(_onMarkAllNotificationsAsRead);
  }

  Future<void> _onFetchNotifications(
    FetchNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(NotificationsLoading());
    final result = await getNotifications();
    result.fold(
      (failure) => emit(NotificationsError(message: failure.message)),
      (notifications) => emit(NotificationsLoaded(notifications: notifications)),
    );
  }

  Future<void> _onMarkNotificationAsRead(
    MarkNotificationAsReadEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is NotificationsLoaded) {
      final updatedNotifications = currentState.notifications.map((notification) {
        if (notification.id == event.id) {
          // Create a new notification with isRead set to true
          return NotificationEntity(
            id: notification.id,
            title: notification.title,
            message: notification.message,
            timestamp: notification.timestamp,
            isRead: true,
            imageUrl: notification.imageUrl,
            actionUrl: notification.actionUrl,
            type: notification.type,
          );
        }
        return notification;
      }).toList();
      
      emit(NotificationsLoaded(notifications: updatedNotifications));
    }
  }

  Future<void> _onMarkAllNotificationsAsRead(
    MarkAllNotificationsAsReadEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is NotificationsLoaded) {
      final updatedNotifications = currentState.notifications.map((notification) {
        // Create a new notification with isRead set to true
        return NotificationEntity(
          id: notification.id,
          title: notification.title,
          message: notification.message,
          timestamp: notification.timestamp,
          isRead: true,
          imageUrl: notification.imageUrl,
          actionUrl: notification.actionUrl,
          type: notification.type,
        );
      }).toList();
      
      emit(NotificationsLoaded(notifications: updatedNotifications));
    }
  }
}
