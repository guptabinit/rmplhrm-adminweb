import 'package:holiday_api/holiday_api.dart';

class HolidayRepository {
  const HolidayRepository({
    required HolidayApi api,
  }) : _api = api;

  final HolidayApi _api;

  Stream<List<Holiday>> getHolidays(DateTime date) => _api.getHolidays(date);
}
