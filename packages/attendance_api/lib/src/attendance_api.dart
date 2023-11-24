import 'package:attendance_api/attendance_api.dart';

abstract class AttendanceApi {
  const AttendanceApi();

  Stream<List<Attendance>> getAttendances({
    required String creator,
    required DateTime createAt,
  });
}
