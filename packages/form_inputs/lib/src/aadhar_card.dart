import 'package:formz/formz.dart';

enum AadharCardValidationError {
  required,
  invalid,
}

class AadharCard extends FormzInput<String?, AadharCardValidationError> {
  const AadharCard.pure() : super.pure('');

  const AadharCard.dirty([super.value = '']) : super.dirty();

  static final _aadharCardRegex =
      RegExp(r'^[A-Z]{5}[A-Z2][A-Z]{4}[0-9]{4}[A-Z]{1}$');

  @override
  AadharCardValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return AadharCardValidationError.required;
    } else if (!_aadharCardRegex.hasMatch(value)) {
      return AadharCardValidationError.invalid;
    }
    return null;
  }
}

extension AadharCardValidationErrorX on AadharCardValidationError {
  String get text => switch (this) {
        AadharCardValidationError.required => 'Aadhar Card is required',
        AadharCardValidationError.invalid => 'Aadhar Card is invalid',
      };
}
