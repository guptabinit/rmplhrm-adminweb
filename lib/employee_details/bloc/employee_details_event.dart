part of 'employee_details_bloc.dart';

sealed class EmployeeDetailsEvent extends Equatable {
  const EmployeeDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class EmployeeDetailsFetched extends EmployeeDetailsEvent {
  const EmployeeDetailsFetched(this.creator);

  @override
  List<Object?> get props => [creator];

  final String creator;
}
