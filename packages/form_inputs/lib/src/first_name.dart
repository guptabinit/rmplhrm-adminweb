import 'package:formz/formz.dart';

enum FirstNameValidationError {
  required,
  invalid,
}

class FirstName extends FormzInput<String?, FirstNameValidationError> {
  const FirstName.pure() : super.pure('');

  const FirstName.dirty([super.value = '']) : super.dirty();

  static final _nameRegex =
      RegExp(r"^[a-zA-Z]+(([', -][a-zA-Z ])?[a-zA-Z]*)*$");

  @override
  FirstNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FirstNameValidationError.required;
    } else if (!_nameRegex.hasMatch(value)) {
      return FirstNameValidationError.invalid;
    }
    return null;
  }
}

extension FirstNameValidationErrorX on FirstNameValidationError {
  String get text => switch (this) {
        FirstNameValidationError.required => 'First name is required',
        FirstNameValidationError.invalid =>
          'First name contains invalid characters',
      };
}
