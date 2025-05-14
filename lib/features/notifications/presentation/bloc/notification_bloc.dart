import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/notifications/domain/usecase/get_notifications.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_event.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotifications getNotifications;

  NotificationsBloc({required this.getNotifications}) : super(NotificationsInitial()) {
    on<GetNotificationsEvent>(_onGetNotifications);
  }

  Future<void> _onGetNotifications(
    GetNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(NotificationsLoading());
    
    final result = await getNotifications();
    
    result.fold(
      (failure) => emit(NotificationsError(message: failure.message)),
      (notifications) => emit(NotificationsLoaded(notifications: notifications)),
    );
  }
}