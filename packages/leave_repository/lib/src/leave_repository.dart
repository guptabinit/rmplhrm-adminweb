import 'package:leave_api/leave_api.dart';

class LeaveRepository {
  const LeaveRepository({
    required LeaveApi api,
  }) : _api = api;

  Stream<List<Leave>> getLeaves({
    required String under,
    required DateTime date,
  }) =>
      _api.getLeaves(
        under: under,
        date: date,
      );

  Future<Leave> getLeave({
    required String id,
  }) =>
      _api.getLeave(id: id);

  final LeaveApi _api;
}
