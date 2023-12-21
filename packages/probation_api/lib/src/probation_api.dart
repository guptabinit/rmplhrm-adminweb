import 'package:employee_api/employee_api.dart';

abstract class ProbationApi {
  const ProbationApi();

  Stream<Iterable<Employee>> getProbationEmployees({
    required String creator,
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
