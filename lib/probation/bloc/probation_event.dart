part of 'probation_bloc.dart';

sealed class ProbationEvent extends Equatable {
  const ProbationEvent();

  @override
  List<Object?> get props => [];
}

final class ProbationEmployeesFetched extends ProbationEvent {
  const ProbationEmployeesFetched(this.creator);

  final String creator;
}

final class RefreshProbationEmployees extends ProbationEvent {
  const RefreshProbationEmployees(this.creator);

  final String creator;
}

final class RemoveFromProbation extends ProbationEvent {
  const RemoveFromProbation(this.id);

  final String id;
}
