import 'package:formz/formz.dart';

enum HolidayTitleValidationError {
  required,
  invalid,
}

class HolidayTitle extends FormzInput<String?, HolidayTitleValidationError> {
  const HolidayTitle.pure() : super.pure('');
  const HolidayTitle.dirty([super.value = '']) : super.dirty();

  @override
  HolidayTitleValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return HolidayTitleValidationError.required;
    }
    if (value.trim() == '') {
      return HolidayTitleValidationError.invalid;
    }
    return null;
  }
}

extension HolidayTitleValidationErrorX on HolidayTitleValidationError {
  String get text {
    switch (this) {
      case HolidayTitleValidationError.required:
        return 'Holiday title is required.';
      case HolidayTitleValidationError.invalid:
        return 'Holiday title contains invalid characters.';
    }
  }
}
