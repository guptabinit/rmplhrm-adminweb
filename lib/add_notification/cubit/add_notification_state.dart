part of 'add_notification_cubit.dart';

final class AddNotificationState extends Equatable {
  const AddNotificationState({
    this.notificationReceiver = const NotificationReceiver.pure(),
    this.notificationType = const NotificationType.pure(),
    this.message = const Message.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  AddNotificationState copyWith({
    NotificationReceiver? notificationReceiver,
    NotificationType? notificationType,
    Message? message,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      AddNotificationState(
        notificationReceiver: notificationReceiver ?? this.notificationReceiver,
        notificationType: notificationType ?? this.notificationType,
        message: message ?? this.message,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        notificationReceiver,
        notificationType,
        message,
        status,
        isValid,
        errorMessage,
      ];

  final NotificationReceiver notificationReceiver;
  final NotificationType notificationType;
  final Message message;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
}
