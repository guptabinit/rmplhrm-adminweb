import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_location_api/live_location_api.dart';

class LiveLocationApiClient extends LiveLocationApi {
  const LiveLocationApiClient({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Location?> lastLocation({
    required String userId,
  }) {
    return _firestore
        .collection('user_locations')
        .doc(userId)
        .collection('location_history')
        .orderBy(
          'timestamp',
          descending: true,
        )
        .snapshots()
        .map(
          (event) => event.docs.firstOrNull != null
              ? Location.fromJson(event.docs.first.data())
              : null,
        );
  }

  final FirebaseFirestore _firestore;
}
