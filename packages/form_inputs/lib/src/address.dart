import 'package:formz/formz.dart';

enum AddressValidationError {
  required,
  invalid,
}

class Address extends FormzInput<String?, AddressValidationError> {
  const Address.pure() : super.pure('');

  const Address.dirty([super.value = '']) : super.dirty();

  @override
  AddressValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return AddressValidationError.required;
    }
    if (value.length < 5) {
      return AddressValidationError.invalid;
    }
    return null;
  }
}

extension AddressValidationErrorX on AddressValidationError {
  String get text => switch (this) {
        AddressValidationError.required => 'Address is required',
        AddressValidationError.invalid =>
          'Address must be at least 5 characters long'
      };
}
