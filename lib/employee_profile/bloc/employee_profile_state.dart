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

enum MarkProbationEmployeeStatus {
  initial,
  loading,
  success,
  failure,
}

enum RemoveProbationEmployeeStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeProfileState extends Equatable {
  const EmployeeProfileState({
    this.status = EmployeeProfileStatus.initial,
    this.deleteEmployeeProfileStatus = DeleteEmployeeProfileStatus.initial,
    this.markProbationEmployeeStatus = MarkProbationEmployeeStatus.initial,
    this.removeProbationEmployeeStatus = RemoveProbationEmployeeStatus.initial,
  });

  EmployeeProfileState copyWith({
    EmployeeProfileStatus? status,
    DeleteEmployeeProfileStatus? deleteEmployeeProfileStatus,
    MarkProbationEmployeeStatus? markProbationEmployeeStatus,
    RemoveProbationEmployeeStatus? removeProbationEmployeeStatus,
  }) {
    return EmployeeProfileState(
      status: status ?? this.status,
      deleteEmployeeProfileStatus:
          deleteEmployeeProfileStatus ?? this.deleteEmployeeProfileStatus,
      markProbationEmployeeStatus:
          markProbationEmployeeStatus ?? this.markProbationEmployeeStatus,
      removeProbationEmployeeStatus:
          removeProbationEmployeeStatus ?? this.removeProbationEmployeeStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        deleteEmployeeProfileStatus,
        markProbationEmployeeStatus,
        removeProbationEmployeeStatus,
      ];

  final EmployeeProfileStatus status;
  final DeleteEmployeeProfileStatus deleteEmployeeProfileStatus;
  final MarkProbationEmployeeStatus markProbationEmployeeStatus;
  final RemoveProbationEmployeeStatus removeProbationEmployeeStatus;
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

extension MarkProbationEmployeeStatusX on MarkProbationEmployeeStatus {
  bool get isInitial => this == MarkProbationEmployeeStatus.initial;

  bool get isLoading => this == MarkProbationEmployeeStatus.loading;

  bool get isSuccess => this == MarkProbationEmployeeStatus.success;

  bool get isFailure => this == MarkProbationEmployeeStatus.failure;
}

extension RemoveProbationEmployeeStatusX on RemoveProbationEmployeeStatus {
  bool get isInitial => this == RemoveProbationEmployeeStatus.initial;

  bool get isLoading => this == RemoveProbationEmployeeStatus.loading;

  bool get isSuccess => this == RemoveProbationEmployeeStatus.success;

  bool get isFailure => this == RemoveProbationEmployeeStatus.failure;
}
