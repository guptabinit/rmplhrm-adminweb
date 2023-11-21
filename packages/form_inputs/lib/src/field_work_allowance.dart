import 'package:formz/formz.dart';

enum FieldWorkAllowanceValidationError {
  required,
  invalid,
}

class FieldWorkAllowance
    extends FormzInput<String?, FieldWorkAllowanceValidationError> {
  const FieldWorkAllowance.pure() : super.pure('');

  const FieldWorkAllowance.dirty([super.value = '']) : super.dirty();

  static const _allowance = [
    'yes',
    'no',
  ];

  @override
  FieldWorkAllowanceValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FieldWorkAllowanceValidationError.required;
    }
    if (!_allowance.contains(value.toLowerCase())) {
      return FieldWorkAllowanceValidationError.invalid;
    }
    return null;
  }
}

extension FieldWorkAllowanceValidationErrorX
    on FieldWorkAllowanceValidationError {
  String get message => switch (this) {
        FieldWorkAllowanceValidationError.required =>
          'Field work allowance is required',
        FieldWorkAllowanceValidationError.invalid =>
          'Field work allowance should be yes or no',
      };
}
