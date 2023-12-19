part of 'update_salary_details_bloc.dart';

enum UpdateSalaryDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

final class UpdateSalaryDetailsState {
  const UpdateSalaryDetailsState({
    this.status = UpdateSalaryDetailsStatus.initial,
    this.selectedEmployees = const {},
  });

  UpdateSalaryDetailsState copyWith({
    UpdateSalaryDetailsStatus? status,
    Set<Employee>? selectedEmployees,
  }) {
    return UpdateSalaryDetailsState(
      status: status ?? this.status,
      selectedEmployees: selectedEmployees ?? this.selectedEmployees,
    );
  }

  final UpdateSalaryDetailsStatus status;
  final Set<Employee> selectedEmployees;
}
