part of 'employee_profile_bloc.dart';

enum EmployeeProfileStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeProfileState extends Equatable {
  const EmployeeProfileState({
    this.status = EmployeeProfileStatus.initial,
  });

  EmployeeProfileState copyWith({
    EmployeeProfileStatus? status,
  }) {
    return EmployeeProfileState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];

  final EmployeeProfileStatus status;
}

extension EmployeeProfileStatusX on EmployeeProfileStatus {
  bool get isInitial => this == EmployeeProfileStatus.initial;

  bool get isLoading => this == EmployeeProfileStatus.loading;

  bool get isSuccess => this == EmployeeProfileStatus.success;

  bool get isFailure => this == EmployeeProfileStatus.failure;
}
