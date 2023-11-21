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
  });

  EmployeeDetailsState copyWith({
    EmployeeDetailsStatus? status,
    List<Employee>? employees,
  }) {
    return EmployeeDetailsState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object?> get props => [status, employees];

  final EmployeeDetailsStatus status;
  final List<Employee> employees;
}
