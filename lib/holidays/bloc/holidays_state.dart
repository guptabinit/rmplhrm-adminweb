part of 'holidays_bloc.dart';

enum HolidaysStatus {
  initial,
  loading,
  failure,
  success,
}

final class HolidaysState extends Equatable {
  HolidaysState({
    this.status = HolidaysStatus.initial,
    this.holidays = const [],
    DateTime? date,
  }) : date = date ?? DateTime.now();

  HolidaysState copyWith({
    HolidaysStatus? status,
    List<Holiday>? holidays,
    DateTime? date,
  }) =>
      HolidaysState(
        status: status ?? this.status,
        holidays: holidays ?? this.holidays,
        date: date ?? this.date,
      );

  @override
  List<Object?> get props => [status, holidays, date];

  final HolidaysStatus status;
  final List<Holiday> holidays;
  final DateTime? date;
}

extension HolidaysStatusX on HolidaysStatus {
  bool get isInitial => this == HolidaysStatus.initial;
  bool get isLoading => this == HolidaysStatus.loading;
  bool get isFailure => this == HolidaysStatus.failure;
  bool get isSuccess => this == HolidaysStatus.success;
}
