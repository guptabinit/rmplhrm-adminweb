import 'dart:io';

import 'package:formz/formz.dart';

enum OptionalImageValidationError {
  invalid,
  fileTooLarge,
}

class OptionalImage extends FormzInput<String?, OptionalImageValidationError> {
  const OptionalImage.pure() : super.pure('');

  const OptionalImage.dirty([super.value = '']) : super.dirty();

  @override
  OptionalImageValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return null;
    final file = File(value);
    final sizeInBytes = file.lengthSync();
    final sizeInMB = sizeInBytes / (1024 * 1024);
    if (sizeInMB > 2) return OptionalImageValidationError.fileTooLarge;
    final isExists = File(value).existsSync();
    if (!isExists) return OptionalImageValidationError.invalid;
    return null;
  }
}

extension OptionalImageValidationErrorX on OptionalImageValidationError {
  String get message => switch (this) {
        OptionalImageValidationError.invalid => 'Invalid image',
        OptionalImageValidationError.fileTooLarge =>
          'Image is too large, max size is 2MB',
      };
}
