import 'package:formz/formz.dart';

enum HRAValidationError {
  required,
  invalid,
}

class HRA extends FormzInput<String?, HRAValidationError> {
  const HRA.pure() : super.pure('');

  const HRA.dirty([super.value = '']) : super.dirty();

  @override
  HRAValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return HRAValidationError.required;
    return null;
  }
}

extension HRAValidationErrorX on HRAValidationError {
  String get message => switch (this) {
        HRAValidationError.required => 'This field is required',
        HRAValidationError.invalid => 'This field is invalid',
      };
}
