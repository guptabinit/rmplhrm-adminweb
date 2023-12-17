import 'package:holiday_api/holiday_api.dart';

abstract class HolidayApi {
  const HolidayApi();

  Stream<List<Holiday>> getHolidays({
    required String creator,
    required DateTime date,
  });

  Future<void> deleteHoliday({
    required String creator,
    required String id,
  });

  Future<void> createHoliday({
    required String creator,
    required DateTime date,
    required String title,
  });

  Future<void> updateHoliday({
    required String id,
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

class UpdateHolidayException implements Exception {
  const UpdateHolidayException([
    this.message = 'Failed to create holiday',
  ]);

  factory UpdateHolidayException.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'failed_precondition':
        return const UpdateHolidayException('The query requires an index.');
      case 'not-found':
        return const UpdateHolidayException('The holiday does not exist.');
      default:
        return const UpdateHolidayException();
    }
  }

  final String message;
}

class DeleteHolidayException implements Exception {
  const DeleteHolidayException([
    this.message = 'Failed to delete holiday',
  ]);

  factory DeleteHolidayException.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'failed_precondition':
        return const DeleteHolidayException('The query requires an index.');
      case 'not-found':
        return const DeleteHolidayException('The holiday does not exist.');
      default:
        return const DeleteHolidayException();
    }
  }

  final String message;
}
