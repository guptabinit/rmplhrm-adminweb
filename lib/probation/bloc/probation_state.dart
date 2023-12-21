part of 'probation_bloc.dart';

enum ProbationStatus {
  initial,
  loading,
  success,
  failure,
}

final class ProbationState extends Equatable {
  const ProbationState({
    this.status = ProbationStatus.initial,
    this.employees = const [],
  });

  ProbationState copyWith({
    ProbationStatus? status,
    List<Employee>? employees,
  }) {
    return ProbationState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object?> get props => [status, employees];

  final ProbationStatus status;
  final List<Employee> employees;
}

extension ProbationStatusX on ProbationStatus {
  bool get isInitial => this == ProbationStatus.initial;

  bool get isLoading => this == ProbationStatus.loading;

  bool get isSuccess => this == ProbationStatus.success;

  bool get isFailure => this == ProbationStatus.failure;
}
