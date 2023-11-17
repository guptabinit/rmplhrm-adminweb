import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holiday_repository/holiday_repository.dart';

class CreateHolidayException implements Exception {
  CreateHolidayException([
    this.message = 'Failed to create holiday',
  ]);

  factory CreateHolidayException.fromCode(String code) {
    switch (code) {
      default:
        return CreateHolidayException();
    }
  }

  final String message;
}

class HolidayRepository {
  HolidayRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createHoliday({
    required String title,
    required DateTime date,
  }) async {
    try {
      final doc = _firestore.collection('holidays').doc();

      final holiday = Holiday(
        id: doc.id,
        createdAt: Timestamp.now().toDate(),
        date: Timestamp.fromDate(date).toDate(),
        title: title,
      );

      await doc.set(holiday.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  final FirebaseFirestore _firestore;
}
