part of 'employee_details_bloc.dart';

enum EmployeeDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeDetailsState extends Equatable {
  const EmployeeDetailsState({
    this.status = EmployeeDetailsStatus.initial,
    this.employees = const [],
    this.selectedEmployee,
  });

  EmployeeDetailsState copyWith({
    EmployeeDetailsStatus? status,
    List<Employee>? employees,
    Employee? selectedEmployee,
  }) {
    return EmployeeDetailsState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      selectedEmployee: selectedEmployee ?? this.selectedEmployee,
    );
  }

  @override
  List<Object?> get props => [status, employees, selectedEmployee];

  final EmployeeDetailsStatus status;
  final List<Employee> employees;
  final Employee? selectedEmployee;
}
