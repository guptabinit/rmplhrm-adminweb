import 'package:employee_api/employee_api.dart';

abstract class ProbationApi {
  const ProbationApi();

  Stream<List<Employee>> getProbationEmployees({
    required String creator,
  });

  Future<void> removeFromProbation(String id);

  Future<void> addToProbation({
    required String id,
    required DateTime date,
  });
}

final class ProbationFetchedFailure implements Exception {
  const ProbationFetchedFailure([
    this.message = 'Something went wrong while fetching probation employees.',
  ]);

  factory ProbationFetchedFailure.fromCode(String code) {
    switch (code) {
      default:
        return const ProbationFetchedFailure();
    }
  }

  final String message;
}

final class RemoveFromProbationFailure implements Exception {
  const RemoveFromProbationFailure([
    this.message =
        'Something went wrong while removing employee from probation.',
  ]);

  factory RemoveFromProbationFailure.fromCode(String code) {
    switch (code) {
      default:
        return const RemoveFromProbationFailure();
    }
  }

  final String message;
}

final class AddToProbationFailure implements Exception {
  const AddToProbationFailure([
    this.message = 'Something went wrong while mark employee as probation.',
  ]);

  factory AddToProbationFailure.fromCode(String code) {
    switch (code) {
      default:
        return const AddToProbationFailure();
    }
  }

  final String message;
}
