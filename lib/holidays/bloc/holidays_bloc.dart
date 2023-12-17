import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:holiday_repository/holiday_repository.dart';

part 'holidays_event.dart';
part 'holidays_state.dart';

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  HolidaysBloc({
    required HolidayRepository holidayRepository,
  })  : _holidayRepository = holidayRepository,
        super(HolidaysState()) {
    on<HolidaysFetched>(_onHolidaysFetched);
    on<HolidaysDateChanged>(_onHolidaysDateChanged);
    on<DeleteHoliday>(_onDeleteHoliday);
    on<SelectedHoliday>(_onSelectedHoliday);
    on<UnselectedHoliday>(_onUnselectedHoliday);
  }

  Future<void> _onHolidaysFetched(
    HolidaysFetched event,
    Emitter<HolidaysState> emit,
  ) async {
    emit(state.copyWith(status: HolidaysStatus.loading));

    await emit.forEach<List<Holiday>>(
      _holidayRepository.getHolidays(
        creator: event.creator,
        date: state.date ?? DateTime.now(),
      ),
      onData: (holidays) => state.copyWith(
        holidays: holidays,
        status: HolidaysStatus.success,
      ),
      onError: (_, __) => state.copyWith(
        status: HolidaysStatus.failure,
      ),
    );
  }

  void _onHolidaysDateChanged(
    HolidaysDateChanged event,
    Emitter<HolidaysState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  Future<void> _onDeleteHoliday(
    DeleteHoliday event,
    Emitter<HolidaysState> emit,
  ) async {
    emit(
      state.copyWith(
        deleteStatus: HolidayDeleteStatus.loading,
      ),
    );
    try {
      await _holidayRepository.deleteHoliday(
        creator: event.creator,
        id: event.id,
      );
      emit(
        state.copyWith(
          deleteStatus: HolidayDeleteStatus.success,
        ),
      );
    } on DeleteHolidayException catch (e) {
      emit(
        state.copyWith(
          deleteStatus: HolidayDeleteStatus.failure,
          deleteError: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteStatus: HolidayDeleteStatus.failure,
          deleteError: 'Failed to delete holiday',
        ),
      );
    }
  }

  final HolidayRepository _holidayRepository;

  void _onSelectedHoliday(
    SelectedHoliday event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      state.copyWith(
        selectedHoliday: event.holiday,
      ),
    );
  }

  void _onUnselectedHoliday(
    UnselectedHoliday event,
    Emitter<HolidaysState> emit,
  ) {
    emit(
      state.copyWith(
        selectedHoliday: Holiday.empty,
      ),
    );
  }
}
