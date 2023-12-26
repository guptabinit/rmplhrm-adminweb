import 'package:employee_api/employee_api.dart';
import 'package:probation_api/probation_api.dart';

class ProbationRepository {
  const ProbationRepository({
    required ProbationApi api,
  }) : _api = api;

  Stream<Iterable<Employee>> getProbationEmployees({
    required String creator,
  }) =>
      _api.getProbationEmployees(
        creator: creator,
      );

  Future<void> removeFromProbation(
    String id,
  ) =>
      _api.removeFromProbation(
        id,
      );

  Future<void> addToProbation({
    required String id,
    required DateTime date,
  }) =>
      _api.addToProbation(
        id: id,
        date: date,
      );

  final ProbationApi _api;
}
