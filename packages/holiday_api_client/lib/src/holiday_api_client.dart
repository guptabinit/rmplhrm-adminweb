import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holiday_api/holiday_api.dart';

class HolidayApiClient extends HolidayApi {
  HolidayApiClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> createHoliday(Holiday holiday) {
    // TODO: implement createHoliday
    throw UnimplementedError();
  }

  @override
  Stream<List<Holiday>> getHolidays(DateTime date) {
    return _firestore
        .collection('holidays')
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
