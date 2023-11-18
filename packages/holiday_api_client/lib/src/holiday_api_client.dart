import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:holiday_api/holiday_api.dart';

class HolidayApiClient extends HolidayApi {
  HolidayApiClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> createHoliday(Holiday holiday) async {
    try {
      await _firestore
          .collection('holidays')
          .doc(holiday.id)
          .set(holiday.toJson());
    } catch (_) {
      throw const CreateHolidayException();
    }
  }

  @override
  Stream<List<Holiday>> getHolidays({
    required DocumentReference creator,
    required DateTime date,
  }) {
    return _firestore
        .collection('holidays')
        .where('creator', isEqualTo: creator)
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
