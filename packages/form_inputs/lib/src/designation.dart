import 'package:formz/formz.dart';

enum DesignationValidationError {
  required,
  invalid,
}

class Designation extends FormzInput<String?, DesignationValidationError> {
  const Designation.pure() : super.pure('');

  const Designation.dirty([super.value = '']) : super.dirty();

  @override
  DesignationValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return DesignationValidationError.required;
    }
    return null;
  }
}

extension DesignationFormValidationErrorX on DesignationValidationError {
  String get text => switch (this) {
        DesignationValidationError.required => 'Designation is required',
        DesignationValidationError.invalid => 'Designation is invalid',
      };
}
