import 'package:cloud_firestore/cloud_firestore.dart';
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
      await _firestore.collection('employees').doc(employeeId).set(
        {
          '$year': {
            '$month': {
              'amount': amount,
              'createdAt': FieldValue.serverTimestamp(),
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
