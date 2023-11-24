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

  final AttendanceApi _api;
}
