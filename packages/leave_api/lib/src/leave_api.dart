import 'package:leave_api/src/models/models.dart';

abstract class LeaveApi {
  const LeaveApi();

  Stream<List<Leave>> getLeaves(DateTime date);
}
