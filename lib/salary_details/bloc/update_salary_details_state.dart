part of 'update_salary_details_bloc.dart';

enum UpdateSalaryDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

enum RemoveSalaryDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

final class UpdateSalaryDetailsState {
  const UpdateSalaryDetailsState({
    this.status = UpdateSalaryDetailsStatus.initial,
    this.selectedEmployees = const {},
    this.removeSalaryDetailsStatus = RemoveSalaryDetailsStatus.initial,
  });

  UpdateSalaryDetailsState copyWith({
    UpdateSalaryDetailsStatus? status,
    Set<Employee>? selectedEmployees,
    RemoveSalaryDetailsStatus? removeSalaryDetailsStatus,
  }) {
    return UpdateSalaryDetailsState(
      status: status ?? this.status,
      selectedEmployees: selectedEmployees ?? this.selectedEmployees,
      removeSalaryDetailsStatus:
          removeSalaryDetailsStatus ?? this.removeSalaryDetailsStatus,
    );
  }

  final UpdateSalaryDetailsStatus status;
  final RemoveSalaryDetailsStatus removeSalaryDetailsStatus;
  final Set<Employee> selectedEmployees;
}

extension UpdateSalaryDetailsStatusX on UpdateSalaryDetailsStatus {
  bool get isInitial => this == UpdateSalaryDetailsStatus.initial;

  bool get isLoading => this == UpdateSalaryDetailsStatus.loading;

  bool get isSuccess => this == UpdateSalaryDetailsStatus.success;

  bool get isFailure => this == UpdateSalaryDetailsStatus.failure;
}

extension RemoveSalaryDetailsStatusX on RemoveSalaryDetailsStatus {
  bool get isInitial => this == RemoveSalaryDetailsStatus.initial;

  bool get isLoading => this == RemoveSalaryDetailsStatus.loading;

  bool get isSuccess => this == RemoveSalaryDetailsStatus.success;

  bool get isFailure => this == RemoveSalaryDetailsStatus.failure;
}
