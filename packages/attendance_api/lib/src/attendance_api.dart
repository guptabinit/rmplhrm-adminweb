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

  Future<void> revokeAttendance({
    required String punchedBy,
    required DateTime createdAt,
  });

  Stream<AttendanceCount> countAttendances({
    required String creator,
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

class RevokeAttendanceFailure implements Exception {
  const RevokeAttendanceFailure([
    this.message = 'Something went wrong while revoking the attendance',
  ]);

  factory RevokeAttendanceFailure.fromCode(String code) {
    switch (code) {
      default:
        return const RevokeAttendanceFailure();
    }
  }

  final String message;
}
