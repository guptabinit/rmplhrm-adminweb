import 'package:leave_api/leave_api.dart';

class LeaveRepository {
  const LeaveRepository({
    required LeaveApi api,
  }) : _api = api;

  Stream<List<Leave>> getLeaves(DateTime date) => _api.getLeaves(date);

  final LeaveApi _api;
}
