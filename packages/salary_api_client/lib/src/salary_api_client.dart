import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:salary_api/salary_api.dart';

class SalaryApiClient implements SalaryApi {
  const SalaryApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<void> updateSalary({
    required String employeeId,
    required double amount,
  }) async {
    try {
      final date = DateTime.now();
      final year = date.year;
      final month = date.month;

      final doc = await _firestore
          .collection('employees')
          .doc(
            employeeId,
          )
          .get();

      Employee? employee;

      if (doc.exists) {
        employee = Employee.fromJson(doc.data()!);
      } else {
        employee = Employee.empty;
      }

      if (employee.salaryDetails?['$year']?['$month'] == null) {
        await _firestore.collection('employees').doc(employeeId).set(
          {
            'salaryDetails': {
              '$year': {
                '$month': {
                  'amount': amount,
                  'createdAt': FieldValue.serverTimestamp(),
                },
              },
            },
          },
          SetOptions(merge: true),
        );
      }
    } on FirebaseException catch (e) {
      throw SalaryDetailUpdateFailure.fromCode(e.code);
    } catch (_) {
      throw const SalaryDetailUpdateFailure();
    }
  }

  @override
  Future<void> removeSalary({required String employeeId}) async {
    try {
      final date = DateTime.now();
      final year = date.year;
      final month = date.month;
      await _firestore.collection('employees').doc(employeeId).set(
        {
          'salaryDetails': {
            '$year': {
              '$month': FieldValue.delete(),
            },
          },
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      throw SalaryDetailUpdateFailure.fromCode(e.code);
    } catch (_) {
      throw const SalaryDetailUpdateFailure();
    }
  }
}
