import 'package:attendance_api/attendance_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';

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

  @override
  Future<void> updateAttendance({
    required String punchedBy,
    required DateTime createdAt,
    DateTime? punchIn,
    DateTime? punchOut,
  }) async {
    try {
      final data = <String, dynamic>{};

      if (punchIn != null) data['punchedIn'] = punchIn;
      if (punchOut != null) data['punchedOut'] = punchOut;

      await _firestore
          .collection('common')
          .doc('attendance')
          .collection(punchedBy)
          .doc('${createdAt.year}')
          .collection('${createdAt.month}')
          .doc('${createdAt.day}')
          .update(data);
    } on FirebaseException catch (e) {
      throw UpdateAttendanceFailure.fromCode(e.code);
    } catch (e) {
      throw const UpdateAttendanceFailure();
    }
  }

  @override
  Future<void> revokeAttendance({
    required String punchedBy,
    required DateTime createdAt,
  }) async {
    try {
      await _firestore
          .collection('common')
          .doc('attendance')
          .collection(punchedBy)
          .doc('${createdAt.year}')
          .collection('${createdAt.month}')
          .doc('${createdAt.day}')
          .delete();
    } on FirebaseException catch (e) {
      throw RevokeAttendanceFailure.fromCode(e.code);
    } catch (e) {
      throw const RevokeAttendanceFailure();
    }
  }

  @override
  Stream<AttendanceCount> countAttendances({
    required String creator,
    required DateTime date,
  }) async* {
    final employeeDocs = _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map(
          (event) => event.docs.map(
            (el) => Employee.fromJson(
              el.data(),
            ),
          ),
        );

    await for (final employees in employeeDocs) {
      const attendanceCount = AttendanceCount.empty;
      var present = 0;
      var absent = 0;
      for (final employee in employees) {
        final attendanceDoc = await _firestore
            .collection('common')
            .doc('attendance')
            .collection(employee.uid!)
            .doc('${date.year}')
            .collection('${date.month}')
            .doc('${date.day}')
            .get();
        if (attendanceDoc.exists) {
          present = present + 1;
        } else {
          absent = absent + 1;
        }
      }
      yield attendanceCount.copyWith(
        present: present,
        absent: absent,
        total: employees.length,
      );
    }

    yield AttendanceCount.empty;
  }

  @override
  Stream<AttendancePercentage> attendancesPercentage({
    required String creator,
  }) async* {
    final employeeDocs = _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map(
          (event) => event.docs.map(
            (el) => Employee.fromJson(
              el.data(),
            ),
          ),
        );

    final date = DateTime.now();

    await for (final employees in employeeDocs) {
      const attendancePercentage = AttendancePercentage.empty;
      final total = employees.length;
      var present = 0;
      var absent = 0;
      for (final employee in employees) {
        final attendanceDoc = await _firestore
            .collection('common')
            .doc('attendance')
            .collection(employee.uid!)
            .doc('${date.year}')
            .collection('${date.month}')
            .doc('${date.day}')
            .get();
        if (attendanceDoc.exists) {
          present = present + 1;
        } else {
          absent = absent + 1;
        }
      }

      yield attendancePercentage.copyWith(
        present: present,
        absent: absent,
        total: total,
      );
    }

    yield AttendancePercentage.empty;
  }

  final FirebaseFirestore _firestore;
}
