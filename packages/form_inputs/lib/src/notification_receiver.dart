import 'package:formz/formz.dart';

enum NotificationReceiverValidationError {
  required,
  invalid,
}

class NotificationReceiver
    extends FormzInput<String?, NotificationReceiverValidationError> {
  const NotificationReceiver.pure() : super.pure('');
  const NotificationReceiver.dirty([super.value = '']) : super.dirty();

  static const receivers = ['all'];

  @override
  NotificationReceiverValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NotificationReceiverValidationError.required;
    }
    if (!receivers.contains(value)) {
      return NotificationReceiverValidationError.invalid;
    }
    return null;
  }
}

extension NotificationReceiverValidationErrorX
    on NotificationReceiverValidationError {
  String get text => switch (this) {
        NotificationReceiverValidationError.required =>
          'This field is required',
        NotificationReceiverValidationError.invalid => 'This field is invalid',
      };
}
