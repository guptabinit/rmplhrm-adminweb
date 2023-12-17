part of 'holidays_bloc.dart';

enum HolidaysStatus {
  initial,
  loading,
  failure,
  success,
}

enum HolidayDeleteStatus {
  initial,
  loading,
  failure,
  success,
}

final class HolidaysState extends Equatable {
  HolidaysState({
    this.status = HolidaysStatus.initial,
    this.holidays = const [],
    this.deleteStatus = HolidayDeleteStatus.initial,
    this.deleteError,
    DateTime? date,
    this.selectedHoliday = Holiday.empty,
  }) : date = date ?? DateTime.now();

  HolidaysState copyWith({
    HolidaysStatus? status,
    List<Holiday>? holidays,
    HolidayDeleteStatus? deleteStatus,
    DateTime? date,
    String? deleteError,
    Holiday? selectedHoliday,
  }) =>
      HolidaysState(
        status: status ?? this.status,
        holidays: holidays ?? this.holidays,
        date: date ?? this.date,
        deleteStatus: deleteStatus ?? this.deleteStatus,
        deleteError: deleteError ?? this.deleteError,
        selectedHoliday: selectedHoliday ?? this.selectedHoliday,
      );

  @override
  List<Object?> get props => [
        status,
        holidays,
        date,
        deleteStatus,
        deleteError,
        selectedHoliday,
      ];

  final HolidaysStatus status;
  final HolidayDeleteStatus deleteStatus;
  final String? deleteError;
  final List<Holiday> holidays;
  final DateTime? date;
  final Holiday? selectedHoliday;
}

extension HolidaysStatusX on HolidaysStatus {
  bool get isInitial => this == HolidaysStatus.initial;

  bool get isLoading => this == HolidaysStatus.loading;

  bool get isFailure => this == HolidaysStatus.failure;

  bool get isSuccess => this == HolidaysStatus.success;
}

extension HolidayDeleteStatusX on HolidayDeleteStatus {
  bool get isInitial => this == HolidayDeleteStatus.initial;

  bool get isLoading => this == HolidayDeleteStatus.loading;

  bool get isFailure => this == HolidayDeleteStatus.failure;

  bool get isSuccess => this == HolidayDeleteStatus.success;
}
