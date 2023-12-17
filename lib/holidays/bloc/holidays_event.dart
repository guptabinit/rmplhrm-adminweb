part of 'holidays_bloc.dart';

sealed class HolidaysEvent extends Equatable {
  const HolidaysEvent();

  @override
  List<Object?> get props => [];
}

final class HolidaysFetched extends HolidaysEvent {
  const HolidaysFetched(this.creator);

  final String creator;

  @override
  List<Object?> get props => [creator];
}

final class HolidaysDateChanged extends HolidaysEvent {
  const HolidaysDateChanged(this.date);

  @override
  List<Object?> get props => [date];

  final DateTime date;
}

final class DeleteHoliday extends HolidaysEvent {
  const DeleteHoliday({
    required this.id,
    required this.creator,
  });

  @override
  List<Object?> get props => [
        id,
        creator,
      ];

  final String id;
  final String creator;
}

final class SelectedHoliday extends HolidaysEvent {
  const SelectedHoliday({required this.holiday});

  @override
  List<Object?> get props => [holiday];

  final Holiday holiday;
}

final class UnselectedHoliday extends HolidaysEvent {
  const UnselectedHoliday();

  @override
  List<Object?> get props => [];
}
