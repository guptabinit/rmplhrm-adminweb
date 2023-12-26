import 'package:formz/formz.dart';

enum ReasonValidationError {
  invalid,
}

class Reason extends FormzInput<String?, ReasonValidationError> {
  const Reason.pure() : super.pure('');

  const Reason.dirty([super.value = '']) : super.dirty();

  @override
  ReasonValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value == ' ') return ReasonValidationError.invalid;
    return null;
  }
}

extension ReasonValidationErrorX on ReasonValidationError {
  String get text => switch (this) {
        ReasonValidationError.invalid => 'Invalid reason. It must be a string.',
      };
}
