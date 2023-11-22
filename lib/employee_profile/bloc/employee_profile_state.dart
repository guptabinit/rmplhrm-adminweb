part of 'employee_profile_bloc.dart';

enum EmployeeStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeProfileState extends Equatable {
  const EmployeeProfileState({
    this.status = EmployeeStatus.initial,
    this.employee = Employee.empty,
    this.errorMessage,
  });

  EmployeeProfileState copyWith({
    EmployeeStatus? status,
    Employee? employee,
    String? errorMessage,
  }) {
    return EmployeeProfileState(
      status: status ?? this.status,
      employee: employee ?? this.employee,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        employee,
        errorMessage,
      ];

  final EmployeeStatus status;
  final Employee employee;
  final String? errorMessage;
}
