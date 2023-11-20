import 'package:formz/formz.dart';

enum NotificationTypeValidationError {
  required,
  invalid,
}

class NotificationType
    extends FormzInput<String?, NotificationTypeValidationError> {
  const NotificationType.pure() : super.pure('');
  const NotificationType.dirty([super.value = '']) : super.dirty();

  static const types = [
    'common',
    'urgent',
  ];

  @override
  NotificationTypeValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NotificationTypeValidationError.required;
    }
    if (!types.contains(value)) {
      return NotificationTypeValidationError.invalid;
    }
    return null;
  }
}

extension NotificationTypeValidationErrorX on NotificationTypeValidationError {
  String get text => switch (this) {
        NotificationTypeValidationError.required => 'This field is required.',
        NotificationTypeValidationError.invalid => 'This field is invalid.',
      };
}
