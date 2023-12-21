import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:probation_api/probation_api.dart';

class ProbationApiClient implements ProbationApi {
  const ProbationApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Iterable<Employee>> getProbationEmployees({
    required String creator,
  }) {
    return _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .where('probation', isEqualTo: true)
        .where(
          'probationTill',
          isGreaterThanOrEqualTo: DateTime.now(),
        )
        .snapshots()
        .map(
          (event) => event.docs.map(
            (e) => Employee.fromJson(
              e.data(),
            ),
          ),
        );
  }

  final FirebaseFirestore _firestore;
}
