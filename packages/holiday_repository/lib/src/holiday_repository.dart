import 'package:cloud_firestore/cloud_firestore.dart' show DocumentReference;
import 'package:holiday_api/holiday_api.dart';

class HolidayRepository {
  const HolidayRepository({
    required HolidayApi api,
  }) : _api = api;

  final HolidayApi _api;

  Stream<List<Holiday>> getHolidays({
    required DocumentReference creator,
    required DateTime date,
  }) =>
      _api.getHolidays(
        creator: creator,
        date: date,
      );

  Future<void> createHoliday(Holiday holiday) => _api.createHoliday(holiday);
}
