import 'package:formz/formz.dart';

enum HRAValidationError {
  required,
  invalid,
}

class HRA extends FormzInput<double?, HRAValidationError> {
  const HRA.pure() : super.pure(null);

  const HRA.dirty([super.value]) : super.dirty();

  static final _hraRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

  @override
  HRAValidationError? validator(double? value) {
    if (value == null || value == 0) {
      return HRAValidationError.required;
    }
    if (!_hraRegex.hasMatch(value.toString())) {
      return HRAValidationError.invalid;
    }
    return null;
  }
}

extension HRAValidationErrorX on HRAValidationError {
  String get text => switch (this) {
        HRAValidationError.required => 'This field is required',
        HRAValidationError.invalid => 'This field is invalid',
      };
}
