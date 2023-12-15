part of 'employee_details_bloc.dart';

enum EmployeeDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

enum EmployeeDetailStatus {
  initial,
  loading,
  success,
  failure,
}

final class EmployeeDetailsState extends Equatable {
  const EmployeeDetailsState({
    this.status = EmployeeDetailsStatus.initial,
    this.employeeDetailStatus = EmployeeDetailStatus.initial,
    this.employees = const [],
    this.selectedEmployee = Employee.empty,
    this.searchResults = const [],
    this.searching = false,
    this.errorMessage,
  });

  EmployeeDetailsState copyWith({
    EmployeeDetailsStatus? status,
    EmployeeDetailStatus? employeeDetailStatus,
    List<Employee>? employees,
    Employee? selectedEmployee,
    List<Employee>? searchResults,
    bool? searching,
    String? errorMessage,
  }) {
    return EmployeeDetailsState(
      status: status ?? this.status,
      employeeDetailStatus: employeeDetailStatus ?? this.employeeDetailStatus,
      employees: employees ?? this.employees,
      selectedEmployee: selectedEmployee ?? this.selectedEmployee,
      searching: searching ?? this.searching,
      searchResults: searchResults ?? this.searchResults,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        employeeDetailStatus,
        employees,
        selectedEmployee,
        searching,
        searchResults,
        errorMessage,
      ];

  final EmployeeDetailsStatus status;
  final EmployeeDetailStatus employeeDetailStatus;
  final List<Employee> employees;
  final Employee selectedEmployee;
  final List<Employee> searchResults;
  final bool searching;
  final String? errorMessage;
}

extension EmployeeDetailStatusX on EmployeeDetailStatus {
  bool get isInitial => this == EmployeeDetailStatus.initial;

  bool get isLoading => this == EmployeeDetailStatus.loading;

  bool get isSuccess => this == EmployeeDetailStatus.success;

  bool get isFailure => this == EmployeeDetailStatus.failure;
}

extension EmployeeDetailsStatusX on EmployeeDetailsStatus {
  bool get isInitial => this == EmployeeDetailsStatus.initial;

  bool get isLoading => this == EmployeeDetailsStatus.loading;

  bool get isSuccess => this == EmployeeDetailsStatus.success;

  bool get isFailure => this == EmployeeDetailsStatus.failure;
}
