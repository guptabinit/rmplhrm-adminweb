import 'package:formz/formz.dart';

enum PanCardValidationError {
  required,
  invalid,
}

class PanCard extends FormzInput<String?, PanCardValidationError> {
  const PanCard.pure() : super.pure('');

  const PanCard.dirty([super.value = '']) : super.dirty();

  static final _panCardNumberRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

  @override
  PanCardValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PanCardValidationError.required;
    } else if (!_panCardNumberRegex.hasMatch(value)) {
      return PanCardValidationError.invalid;
    }
    return null;
  }
}

extension PanCardValidationErrorX on PanCardValidationError {
  String get text => switch (this) {
        PanCardValidationError.required => 'Pan Card is required',
        PanCardValidationError.invalid => 'Pan Card is invalid',
      };
}
