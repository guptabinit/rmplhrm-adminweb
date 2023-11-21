import 'package:formz/formz.dart';

enum LastNameValidationError {
  required,
  invalid,
}

class FirstName extends FormzInput<String?, LastNameValidationError> {
  const FirstName.pure() : super.pure('');

  const FirstName.dirty([super.value = '']) : super.dirty();

  static final _nameRegex = RegExp(r'^[a-zA-Z]+$');

  @override
  LastNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return LastNameValidationError.required;
    } else if (!_nameRegex.hasMatch(value)) {
      return LastNameValidationError.invalid;
    }
    return null;
  }
}

extension LastNameValidationErrorX on LastNameValidationError {
  String get text => switch (this) {
        LastNameValidationError.required => 'Last name is required',
        LastNameValidationError.invalid =>
          'Last name contains invalid characters',
      };
}
