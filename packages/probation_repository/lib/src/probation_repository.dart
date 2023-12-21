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

  final ProbationApi _api;
}
