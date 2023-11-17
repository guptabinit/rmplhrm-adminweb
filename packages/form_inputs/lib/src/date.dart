import 'package:formz/formz.dart';
import 'package:validators/validators.dart' show isDate;

enum DateValidationError {
  required,
  invalidDate,
}

class Date extends FormzInput<String?, DateValidationError> {
  const Date.pure() : super.pure(null);
  const Date.dirty([super.value]) : super.dirty();

  @override
  DateValidationError? validator(String? value) {
    if (value == null) return DateValidationError.required;
    if (isDate(value) == false) {
      return DateValidationError.invalidDate;
    }
    return null;
  }
}

extension DateValidationErrorX on DateValidationError {
  String get text => switch (this) {
        DateValidationError.required => 'Date is required',
        DateValidationError.invalidDate => 'Date is not valid',
      };
}
