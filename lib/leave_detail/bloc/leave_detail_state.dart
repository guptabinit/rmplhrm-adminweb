part of 'leave_detail_bloc.dart';

enum LeaveDetailStatus {
  initial,
  loading,
  success,
  failure,
}

final class LeaveDetailState extends Equatable {
  const LeaveDetailState({
    this.status = LeaveDetailStatus.initial,
    this.leave = Leave.empty,
    this.employee = Employee.empty,
  });

  LeaveDetailState copyWith({
    LeaveDetailStatus? status,
    Leave? leave,
    Employee? employee,
  }) {
    return LeaveDetailState(
      status: status ?? this.status,
      leave: leave ?? this.leave,
      employee: employee ?? this.employee,
    );
  }

  final LeaveDetailStatus status;
  final Leave leave;
  final Employee employee;

  @override
  List<Object?> get props => [status, leave, employee];
}
