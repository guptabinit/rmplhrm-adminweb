part of 'probation_bloc.dart';

enum ProbationStatus {
  initial,
  loading,
  success,
  failure,
}

enum RemoveProbationStatus {
  initial,
  loading,
  success,
  failure,
}

final class ProbationState extends Equatable {
  const ProbationState({
    this.status = ProbationStatus.initial,
    this.removeStatus = RemoveProbationStatus.initial,
    this.employees = const [],
    this.errorMessage,
  });

  ProbationState copyWith({
    ProbationStatus? status,
    RemoveProbationStatus? removeStatus,
    List<Employee>? employees,
    String? errorMessage,
  }) {
    return ProbationState(
      status: status ?? this.status,
      removeStatus: removeStatus ?? this.removeStatus,
      employees: employees ?? this.employees,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        removeStatus,
        employees,
        errorMessage,
      ];

  final ProbationStatus status;
  final RemoveProbationStatus removeStatus;
  final List<Employee> employees;
  final String? errorMessage;
}

extension ProbationStatusX on ProbationStatus {
  bool get isInitial => this == ProbationStatus.initial;

  bool get isLoading => this == ProbationStatus.loading;

  bool get isSuccess => this == ProbationStatus.success;

  bool get isFailure => this == ProbationStatus.failure;
}

extension RemoveProbationStatusX on RemoveProbationStatus {
  bool get isInitial => this == RemoveProbationStatus.initial;

  bool get isLoading => this == RemoveProbationStatus.loading;

  bool get isSuccess => this == RemoveProbationStatus.success;

  bool get isFailure => this == RemoveProbationStatus.failure;
}
