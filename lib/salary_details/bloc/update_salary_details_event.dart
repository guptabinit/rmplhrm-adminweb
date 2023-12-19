part of 'update_salary_details_bloc.dart';

sealed class UpdateSalaryDetailsEvent extends Equatable {
  const UpdateSalaryDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class SelectedEmployeeChangedEvent extends UpdateSalaryDetailsEvent {
  final Employee employee;

  const SelectedEmployeeChangedEvent(this.employee);

  @override
  List<Object?> get props => [employee];
}

final class UpdateSalaryDetailsAction extends UpdateSalaryDetailsEvent {
  const UpdateSalaryDetailsAction(this.employees);

  @override
  List<Object?> get props => [employees];

  final List<Employee> employees;
}
