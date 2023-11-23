import 'package:formz/formz.dart';

enum BasicSalaryValidationError {
  required,
  invalid,
}

class BasicSalary extends FormzInput<double?, BasicSalaryValidationError> {
  const BasicSalary.pure() : super.pure(null);

  const BasicSalary.dirty([super.value]) : super.dirty();

  static final _basicSalaryRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

  @override
  BasicSalaryValidationError? validator(double? value) {
    if (value == null || value == 0) {
      return BasicSalaryValidationError.required;
    }
    if (!_basicSalaryRegex.hasMatch(value.toString())) {
      return BasicSalaryValidationError.invalid;
    }
    return null;
  }
}

extension BasicSalaryValidationErrorX on BasicSalaryValidationError {
  String get text => switch (this) {
        BasicSalaryValidationError.required => 'This field is required',
        BasicSalaryValidationError.invalid =>
          'This field must not contain spaces',
      };
}
