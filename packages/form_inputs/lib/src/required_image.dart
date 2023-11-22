import 'dart:io';

import 'package:formz/formz.dart';

enum RequiredImageValidationError {
  required,
  invalid,
  fileTooLarge,
}

class RequiredImage extends FormzInput<String?, RequiredImageValidationError> {
  const RequiredImage.pure() : super.pure('');

  const RequiredImage.dirty([super.value = '']) : super.dirty();

  @override
  RequiredImageValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return RequiredImageValidationError.required;
    }
    final file = File(value);
    final sizeInBytes = file.lengthSync();
    final sizeInMB = sizeInBytes / (1024 * 1024);
    if (sizeInMB > 2) return RequiredImageValidationError.fileTooLarge;
    final isExists = File(value).existsSync();
    if (!isExists) return RequiredImageValidationError.invalid;
    return null;
  }
}

extension RequiredImageValidationErrorX on RequiredImageValidationError {
  String get message => switch (this) {
        RequiredImageValidationError.required => 'Image is required',
        RequiredImageValidationError.invalid => 'Invalid image',
        RequiredImageValidationError.fileTooLarge =>
          'Image is too large, max size is 2MB',
      };
}
