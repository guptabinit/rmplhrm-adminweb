import 'package:formz/formz.dart';

enum BasicSalaryValidationError {
  required,
  invalid,
}

class BasicSalary extends FormzInput<String?, BasicSalaryValidationError> {
  const BasicSalary.pure() : super.pure('');

  const BasicSalary.dirty([super.value = '']) : super.dirty();

  static final _basicSalaryRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

  @override
  BasicSalaryValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return BasicSalaryValidationError.required;
    }
    if (!_basicSalaryRegex.hasMatch(value)) {
      return BasicSalaryValidationError.invalid;
    }
    return null;
  }
}

extension BasicSalaryValidationErrorX on BasicSalaryValidationError {
  String get message => switch (this) {
        BasicSalaryValidationError.required => 'This field is required',
        BasicSalaryValidationError.invalid =>
          'This field must not contain spaces',
      };
}
