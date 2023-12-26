import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leave_api/leave_api.dart';

class LeaveApiClient extends LeaveApi {
  const LeaveApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Leave>> getLeaves({
    required String under,
    required DateTime date,
  }) {
    return _firestore
        .collection('leave')
        .where(
          'under',
          isEqualTo: _firestore.collection('admin').doc(under),
        )
        .where(
          'date',
          isGreaterThanOrEqualTo: DateTime(
            date.year,
            date.month,
          ),
          isLessThanOrEqualTo: DateTime(
            date.year,
            date.month + 1,
            0,
          ),
        )
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          final leave = Leave.fromJson(doc.data());
          return leave;
        }).toList();
      },
    );
  }

  @override
  Future<Leave> getLeave({
    required String id,
  }) async {
    try {
      final doc = await _firestore.collection('leave').doc(id).get();
      if (!doc.exists) {
        throw FetchLeaveFailure.fromCode('not_found');
      }
      return Leave.fromJson(doc.data()!);
    } on FirebaseException catch (e) {
      throw FetchLeaveFailure.fromCode(e.code);
    } catch (_) {
      throw const FetchLeaveFailure();
    }
  }

  @override
  Future<void> updateLeave({
    required String id,
    String? status,
    String? reason,
  }) async {
    try {
      await _firestore
          .collection(
            'leave',
          )
          .doc(id)
          .update(
        {
          'status': status,
          'adminReason': reason,
        },
      );
    } on FirebaseException catch (e) {
      throw UpdateLeaveFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdateLeaveFailure();
    }
  }

  final FirebaseFirestore _firestore;
}
