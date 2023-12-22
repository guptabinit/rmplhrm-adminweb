part of 'edit_attendance_cubit.dart';

final class EditAttendanceState extends Equatable {
  const EditAttendanceState({
    this.punchIn = const Date.pure(),
    this.punchOut = const Date.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  EditAttendanceState copyWith({
    Date? punchIn,
    Date? punchOut,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return EditAttendanceState(
      punchIn: punchIn ?? this.punchIn,
      punchOut: punchOut ?? this.punchOut,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        punchIn,
        punchOut,
        status,
        isValid,
        errorMessage,
      ];

  final Date punchIn;
  final Date punchOut;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
}
