import 'package:formz/formz.dart';

enum EmailValidationError {
  required,
  invalid,
}

class Email extends FormzInput<String?, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return EmailValidationError.required;
    if (!_emailRegExp.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}

extension EmailValidationErrorX on EmailValidationError {
  String get text => switch (this) {
        EmailValidationError.required => 'This field is required.',
        EmailValidationError.invalid => 'This is not a valid email.',
      };
}
