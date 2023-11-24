import 'package:attendance_api/attendance_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AttendanceApiClient extends AttendanceApi {
  const AttendanceApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Attendance>> getAttendances({
    required String creator,
    required DateTime createAt,
  }) async* {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final attendancesDocs = _firestore
        .collection('common')
        .doc('attendance')
        .collection(dateFormat.format(createAt))
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (doc) => Attendance.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );

    await for (final attendances in attendancesDocs) {
      final attendancesList = <Attendance>[];
      for (final attendance in attendances) {
        final punchedByDoc = await attendance.punchedBy?.get();
        Employee employee;
        if (punchedByDoc != null && punchedByDoc.exists) {
          employee = Employee.fromJson(
            punchedByDoc.data()! as Map<String, dynamic>,
          );
        } else {
          employee = Employee.fromJson(const {});
        }
        attendancesList.add(
          attendance.copyWith(employee: employee),
        );
      }
      yield attendancesList;
    }
  }

  final FirebaseFirestore _firestore;
}
