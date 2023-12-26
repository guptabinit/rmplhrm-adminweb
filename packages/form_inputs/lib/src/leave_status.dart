import 'package:formz/formz.dart';

enum LeaveStatusTypeValidationError {
  required,
  invalid,
}

class LeaveStatus extends FormzInput<String?, LeaveStatusTypeValidationError> {
  const LeaveStatus.pure() : super.pure('');

  const LeaveStatus.dirty([super.value = '']) : super.dirty();

  static const _leaveStatusType = [
    'approved',
    'rejected',
    'pending',
  ];

  @override
  LeaveStatusTypeValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return LeaveStatusTypeValidationError.required;
    }
    if (!_leaveStatusType.contains(value.toLowerCase())) {
      return LeaveStatusTypeValidationError.invalid;
    }
    return null;
  }
}

extension LeaveStatusTypeValidationErrorX on LeaveStatusTypeValidationError {
  String get text => switch (this) {
        LeaveStatusTypeValidationError.required => 'Leave status is required',
        LeaveStatusTypeValidationError.invalid =>
          'Leave status should be approved or rejected or pending',
      };
}
