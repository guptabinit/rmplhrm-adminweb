part of 'holidays_bloc.dart';

sealed class HolidaysEvent extends Equatable {
  const HolidaysEvent();

  @override
  List<Object?> get props => [];
}

final class HolidaysFetched extends HolidaysEvent {}

final class HolidaysDateChanged extends HolidaysEvent {
  const HolidaysDateChanged(this.date);

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
