import 'package:formz/formz.dart';

enum PasswordValidationError {
  required,
  invalid,
}

class Password extends FormzInput<String?, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return PasswordValidationError.required;
    if (value.length < 6) return PasswordValidationError.invalid;
    return null;
  }
}

extension PasswordValidationErrorX on PasswordValidationError {
  String get text => switch (this) {
        PasswordValidationError.required => 'Password is required',
        PasswordValidationError.invalid =>
          'Password must be at least 6 characters long',
      };
}
