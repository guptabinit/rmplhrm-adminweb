import 'package:holiday_api/holiday_api.dart';

abstract class HolidayApi {
  const HolidayApi();

  Stream<List<Holiday>> getHolidays({
    required String creator,
    required DateTime date,
  });

  Future<void> createHoliday({
    required String creator,
    required DateTime date,
    required String title,
  });
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
