import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leave_api/leave_api.dart';

class LeaveApiClient extends LeaveApi {
  const LeaveApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<List<Leave>> getLeaves(DateTime date) {
    return _firestore
        .collection('leave')
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

  final FirebaseFirestore _firestore;
}
