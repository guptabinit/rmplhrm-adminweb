import 'package:cloud_firestore/cloud_firestore.dart' show DocumentReference;
import 'package:holiday_api/holiday_api.dart';

abstract class HolidayApi {
  const HolidayApi();

  Stream<List<Holiday>> getHolidays({
    required DocumentReference creator,
    required DateTime date,
  });

  Future<void> createHoliday(Holiday holiday);
}

class CreateHolidayException implements Exception {
  const CreateHolidayException([
    this.message = 'Failed to create holiday',
  ]);

  factory CreateHolidayException.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'failed_precondition':
        return const CreateHolidayException('The query requires an index.');
      default:
        return const CreateHolidayException();
    }
  }

  final String message;
}
