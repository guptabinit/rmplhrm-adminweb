import 'package:attendance_api/attendance_api.dart';

abstract class AttendanceApi {
  const AttendanceApi();

  Stream<List<Attendance>> getAttendances({
    required String creator,
    required DateTime createAt,
  });

  Future<void> updateAttendance({
    required String punchedBy,
    required DateTime createdAt,
    DateTime? punchIn,
    DateTime? punchOut,
  });
}

class UpdateAttendanceFailure implements Exception {
  const UpdateAttendanceFailure([
    this.message = 'Something went wrong while updating the attendance',
  ]);

  factory UpdateAttendanceFailure.fromCode(String code) {
    switch (code) {
      default:
        return const UpdateAttendanceFailure();
    }
  }

  final String message;
}
