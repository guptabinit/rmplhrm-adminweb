import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum DateJoinedValidationError {
  required,
  invalid,
}

class DateJoined extends FormzInput<String?, DateJoinedValidationError> {
  const DateJoined.pure() : super.pure('');

  const DateJoined.dirty([super.value = '']) : super.dirty();

  @override
  DateJoinedValidationError? validator(String? value) {
    if (value == null) return DateJoinedValidationError.required;
    if (isDate(value) == false) {
      return DateJoinedValidationError.invalid;
    }
    return null;
  }
}

extension DateJoinedValidationErrorX on DateJoinedValidationError {
  String get text => switch (this) {
        DateJoinedValidationError.required => 'Date of joining is required',
        DateJoinedValidationError.invalid => 'Date of joining is invalid',
      };
}
