import 'package:holiday_api/holiday_api.dart';

abstract class HolidayApi {
  const HolidayApi();

  Stream<List<Holiday>> getHolidays(DateTime date);

  Future<void> createHoliday(Holiday holiday);
}

class CreateHolidayException implements Exception {
  const CreateHolidayException([
    this.message = 'Failed to create holiday',
  ]);

  final String message;
}
