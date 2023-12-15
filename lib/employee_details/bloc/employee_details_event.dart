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

final class EmployeeDetailsSelected extends EmployeeDetailsEvent {
  const EmployeeDetailsSelected(this.uid);

  @override
  List<Object?> get props => [uid];

  final String uid;
}

final class EmployeeDetailsDeselected extends EmployeeDetailsEvent {
  const EmployeeDetailsDeselected();

  @override
  List<Object?> get props => [];
}

final class EmployeeDetailsSearch extends EmployeeDetailsEvent {
  const EmployeeDetailsSearch(this.searchQuery);

  @override
  List<Object?> get props => [searchQuery];

  final String searchQuery;
}
