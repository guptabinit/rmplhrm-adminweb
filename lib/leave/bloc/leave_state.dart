part of 'leave_bloc.dart';

enum LeaveStatus {
  initial,
  loading,
  success,
  failure,
}

class LeaveState extends Equatable {
  const LeaveState({
    this.status = LeaveStatus.initial,
    this.leaves = const [],
    this.date,
  });

  LeaveState copyWith({
    LeaveStatus? status,
    List<Leave>? leaves,
    DateTime? date,
  }) =>
      LeaveState(
        status: status ?? this.status,
        leaves: leaves ?? this.leaves,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [status, leaves, date];

  final LeaveStatus status;
  final List<Leave> leaves;
  final DateTime? date;
}

extension LeaveStatusX on LeaveStatus {
  bool get isInitial => this == LeaveStatus.initial;
  bool get isLoading => this == LeaveStatus.loading;
  bool get isSuccess => this == LeaveStatus.success;
  bool get isFailure => this == LeaveStatus.failure;
}
