import 'package:attendance_api/attendance_api.dart';

class AttendanceRepository {
  const AttendanceRepository({
    required AttendanceApi api,
  }) : _api = api;

  Stream<List<Attendance>> getAttendances({
    required String creator,
    required DateTime createAt,
  }) =>
      _api.getAttendances(
        creator: creator,
        createAt: createAt,
      );

  Future<void> updateAttendance({
    required String punchedBy,
    required DateTime createdAt,
    DateTime? punchIn,
    DateTime? punchOut,
  }) =>
      _api.updateAttendance(
        punchedBy: punchedBy,
        createdAt: createdAt,
        punchIn: punchIn,
        punchOut: punchOut,
      );

  final AttendanceApi _api;
}
