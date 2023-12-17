import 'package:holiday_api/holiday_api.dart';

class HolidayRepository {
  const HolidayRepository({
    required HolidayApi api,
  }) : _api = api;

  final HolidayApi _api;

  Stream<List<Holiday>> getHolidays({
    required String creator,
    required DateTime date,
  }) =>
      _api.getHolidays(
        creator: creator,
        date: date,
      );

  Future<void> createHoliday({
    required String creator,
    required DateTime date,
    required String title,
  }) =>
      _api.createHoliday(
        creator: creator,
        date: date,
        title: title,
      );

  Future<void> updateHoliday({
    required String id,
    required String creator,
    required DateTime date,
    required String title,
  }) =>
      _api.updateHoliday(
        id: id,
        creator: creator,
        date: date,
        title: title,
      );

  Future<void> deleteHoliday({
    required String creator,
    required String id,
  }) =>
      _api.deleteHoliday(
        creator: creator,
        id: id,
      );
}
