part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class FetchNotificationsEvent extends NotificationsEvent {}

class MarkNotificationAsReadEvent extends NotificationsEvent {
  final String id;

  const MarkNotificationAsReadEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class MarkAllNotificationsAsReadEvent extends NotificationsEvent {}
