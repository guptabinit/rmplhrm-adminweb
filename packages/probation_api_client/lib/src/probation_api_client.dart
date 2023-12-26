import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:probation_api/probation_api.dart';

class ProbationApiClient implements ProbationApi {
  const ProbationApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Employee>> getProbationEmployees({
    required String creator,
  }) {
    return _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .where('probation', isEqualTo: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Employee.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> removeFromProbation(String id) async {
    try {
      await _firestore.collection('employees').doc(id).update({
        'probation': false,
        'probationTill': null,
      });
    } on FirebaseException catch (e) {
      throw RemoveFromProbationFailure.fromCode(e.code);
    } catch (_) {
      throw const RemoveFromProbationFailure();
    }
  }

  @override
  Future<void> addToProbation({
    required String id,
    required DateTime date,
  }) async {
    try {
      await _firestore.collection('employees').doc(id).update({
        'probation': true,
        'probationTill': Timestamp.fromDate(date),
      });
    } on FirebaseException catch (e) {
      throw AddToProbationFailure.fromCode(e.code);
    } catch (_) {
      throw const AddToProbationFailure();
    }
  }

  final FirebaseFirestore _firestore;
}
