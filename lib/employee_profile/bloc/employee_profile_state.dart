part of 'employee_profile_bloc.dart';

enum EmployeeProfileStatus {
  initial,
  loading,
  success,
  failure,
}

enum DeleteEmployeeProfileStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeProfileState extends Equatable {
  const EmployeeProfileState({
    this.status = EmployeeProfileStatus.initial,
    this.deleteEmployeeProfileStatus = DeleteEmployeeProfileStatus.initial,
  });

  EmployeeProfileState copyWith({
    EmployeeProfileStatus? status,
    DeleteEmployeeProfileStatus? deleteEmployeeProfileStatus,
  }) {
    return EmployeeProfileState(
      status: status ?? this.status,
      deleteEmployeeProfileStatus:
          deleteEmployeeProfileStatus ?? this.deleteEmployeeProfileStatus,
    );
  }

  @override
  List<Object?> get props => [status, deleteEmployeeProfileStatus];

  final EmployeeProfileStatus status;
  final DeleteEmployeeProfileStatus deleteEmployeeProfileStatus;
}

extension EmployeeProfileStatusX on EmployeeProfileStatus {
  bool get isInitial => this == EmployeeProfileStatus.initial;

  bool get isLoading => this == EmployeeProfileStatus.loading;

  bool get isSuccess => this == EmployeeProfileStatus.success;

  bool get isFailure => this == EmployeeProfileStatus.failure;
}

extension DeleteEmployeeProfileStatusX on DeleteEmployeeProfileStatus {
  bool get isInitial => this == DeleteEmployeeProfileStatus.initial;

  bool get isLoading => this == DeleteEmployeeProfileStatus.loading;

  bool get isSuccess => this == DeleteEmployeeProfileStatus.success;

  bool get isFailure => this == DeleteEmployeeProfileStatus.failure;
}
