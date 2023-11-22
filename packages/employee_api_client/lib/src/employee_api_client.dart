import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';

class EmployeeApiClient extends EmployeeApi {
  const EmployeeApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Employee>> getEmployees({
    required String creator,
  }) {
    return _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Employee.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Employee> getEmployee({
    required String id,
  }) async {
    try {
      final doc = await _firestore.collection('employees').doc(id).get();
      return Employee.fromJson(doc.data()!);
    } on FirebaseException catch (e) {
      throw EmployeeNotFoundFailure.fromMessage(
        e.message ?? 'Something went wrong',
      );
    } catch (_) {
      throw EmployeeNotFoundFailure();
    }
  }

  final FirebaseFirestore _firestore;
}
