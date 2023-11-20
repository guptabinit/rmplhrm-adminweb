import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:holiday_api/holiday_api.dart';

class HolidayApiClient extends HolidayApi {
  HolidayApiClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> createHoliday({
    required String creator,
    required DateTime date,
    required String title,
  }) async {
    try {
      final unixDate = DateTime(
            date.year,
            date.month,
            date.day,
          ).millisecondsSinceEpoch ~/
          1000;

      final id = '$unixDate-$creator';

      await _firestore.collection('holidays').doc(id).set({
        'id': id,
        'creator': _firestore.collection('admin').doc(creator),
        'createdAt': FieldValue.serverTimestamp(),
        'date': Timestamp.fromDate(date),
        'title': title,
      });
    } catch (_) {
      throw const CreateHolidayException();
    }
  }

  @override
  Stream<List<Holiday>> getHolidays({
    required String creator,
    required DateTime date,
  }) {
    return _firestore
        .collection('holidays')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
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
          (snapshot) => snapshot.docs
              .map(
                (doc) => Holiday.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
