import 'package:formz/formz.dart';

enum EmployeeIdValidationError {
  required,
  invalid,
}

class EmployeeId extends FormzInput<String?, EmployeeIdValidationError> {
  const EmployeeId.pure() : super.pure('');

  const EmployeeId.dirty([super.value = '']) : super.dirty();

  static const employeeIdRegExp = r'^[a-zA-Z0-9-]+$';

  @override
  EmployeeIdValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmployeeIdValidationError.required;
    }
    if (!RegExp(employeeIdRegExp).hasMatch(value)) {
      return EmployeeIdValidationError.invalid;
    }
    return null;
  }
}

extension EmployeeIdValidationErrorX on EmployeeIdValidationError {
  String get text => switch (this) {
        EmployeeIdValidationError.required => 'Employee ID is required',
        EmployeeIdValidationError.invalid => 'Employee ID is invalid',
      };
}
