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

  Future<void> revokeAttendance({
    required String punchedBy,
    required DateTime createdAt,
  }) =>
      _api.revokeAttendance(
        punchedBy: punchedBy,
        createdAt: createdAt,
      );

  Stream<AttendanceCount> countAttendances({
    required String creator,
    required DateTime date,
  }) =>
      _api.countAttendances(
        creator: creator,
        date: date,
      );

  Stream<AttendancePercentage> attendancesPercentage({
    required String creator,
  }) =>
      _api.attendancesPercentage(
        creator: creator,
      );

  final AttendanceApi _api;
}
