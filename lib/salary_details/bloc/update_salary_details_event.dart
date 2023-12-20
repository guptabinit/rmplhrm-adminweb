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

final class UnselectedEmployeeChangedEvent extends UpdateSalaryDetailsEvent {
  const UnselectedEmployeeChangedEvent(this.employee);

  @override
  List<Object?> get props => [employee];

  final Employee employee;
}

final class UpdateSalaryDetailsAction extends UpdateSalaryDetailsEvent {
  const UpdateSalaryDetailsAction(this.employees);

  @override
  List<Object?> get props => [employees];

  final List<Employee> employees;
}

final class UpdateSalaryDetailAction extends UpdateSalaryDetailsEvent {
  const UpdateSalaryDetailAction({
    required this.employee,
    this.amount,
  });

  @override
  List<Object?> get props => [employee, amount];

  final Employee employee;
  final double? amount;
}

final class SelectAllSalaryDetails extends UpdateSalaryDetailsEvent {
  const SelectAllSalaryDetails(this.employees);

  @override
  List<Object?> get props => [employees];

  final List<Employee> employees;
}
