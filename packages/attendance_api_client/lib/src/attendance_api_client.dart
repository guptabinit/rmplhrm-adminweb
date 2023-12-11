import 'package:attendance_api/attendance_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceApiClient extends AttendanceApi {
  const AttendanceApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Attendance>> getAttendances({
    required String creator,
    required DateTime createAt,
  }) async* {
    final idDocs = _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map((event) => event.docs.map((e) => e.id));

    await for (final ids in idDocs) {
      final attendancesList = <Attendance>[];
      for (final id in ids) {
        await for (final attendance in _firestore
            .collection('common')
            .doc('attendance')
            .collection(id)
            .doc('${createAt.year}')
            .collection('${createAt.month}')
            .doc('${createAt.day}')
            .snapshots()
            .map((event) {
          if (!event.exists) return null;
          return Attendance.fromJson(event.data()!);
        })) {
          Employee employee;

          final punchedByDoc = await attendance?.punchedBy?.get();

          if (punchedByDoc != null && punchedByDoc.exists) {
            employee = Employee.fromJson(
              punchedByDoc.data()! as Map<String, dynamic>,
            );
          } else {
            employee = Employee.fromJson(const {});
          }
          if (attendance != null) {
            attendancesList.add(
              attendance.copyWith(employee: employee),
            );
          }

          yield attendancesList;
        }
      }
    }
  }

  final FirebaseFirestore _firestore;
}
