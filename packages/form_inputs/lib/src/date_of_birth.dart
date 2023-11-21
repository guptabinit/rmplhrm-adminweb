import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum DateOfBirthValidationError {
  required,
  invalid,
}

class DateOfBirth extends FormzInput<String?, DateOfBirthValidationError> {
  const DateOfBirth.pure() : super.pure('');

  const DateOfBirth.dirty([super.value = '']) : super.dirty();

  @override
  DateOfBirthValidationError? validator(String? value) {
    if (value == null) return DateOfBirthValidationError.required;
    if (isDate(value) == false) {
      return DateOfBirthValidationError.invalid;
    }
    return null;
  }
}

extension DateOfBirthFormValidationErrorX on DateOfBirthValidationError {
  String get text => switch (this) {
        DateOfBirthValidationError.required => 'Date of birth is required.',
        DateOfBirthValidationError.invalid => 'Date of birth is invalid.',
      };
}
