import 'package:formz/formz.dart';

enum FathersNameValidationError {
  required,
  invalid,
}

class FathersName extends FormzInput<String?, FathersNameValidationError> {
  const FathersName.pure() : super.pure('');

  const FathersName.dirty([super.value = '']) : super.dirty();

  static const _nameRegex = r'^[a-zA-Z]+\s[a-zA-Z]+$';

  @override
  FathersNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FathersNameValidationError.required;
    }
    if (!RegExp(_nameRegex).hasMatch(value)) {
      return FathersNameValidationError.invalid;
    }
    return null;
  }
}

extension FathersNameValidationErrorX on FathersNameValidationError {
  String get text => switch (this) {
        FathersNameValidationError.required => 'Fathers name is required',
        FathersNameValidationError.invalid => 'Fathers name is invalid',
      };
}
