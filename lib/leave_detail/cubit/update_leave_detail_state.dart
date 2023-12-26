part of 'update_leave_detail_cubit.dart';

final class UpdateLeaveDetailState extends Equatable {
  const UpdateLeaveDetailState({
    this.status = FormzSubmissionStatus.initial,
    this.leaveStatus = const LeaveStatus.pure(),
    this.reason = const Reason.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  UpdateLeaveDetailState copyWith({
    FormzSubmissionStatus? status,
    LeaveStatus? leaveStatus,
    Reason? reason,
    bool? isValid,
    String? errorMessage,
  }) {
    return UpdateLeaveDetailState(
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      leaveStatus: leaveStatus ?? this.leaveStatus,
      reason: reason ?? this.reason,
    );
  }

  @override
  List<Object?> get props => [
        status,
        leaveStatus,
        reason,
        isValid,
        errorMessage,
      ];

  final FormzSubmissionStatus status;
  final LeaveStatus leaveStatus;
  final Reason reason;
  final bool isValid;
  final String? errorMessage;
}
