import 'package:formz/formz.dart';

enum MessageValidationError {
  required,
}

class Message extends FormzInput<String?, MessageValidationError> {
  const Message.pure() : super.pure('');
  const Message.dirty([super.value = '']) : super.dirty();

  @override
  MessageValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return MessageValidationError.required;
    }
    return null;
  }
}

extension MessageValidationErrorX on MessageValidationError {
  String get text => switch (this) {
        MessageValidationError.required => 'This field is required',
      };
}
