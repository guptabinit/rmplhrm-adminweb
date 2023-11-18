import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  }

  Future<void> _onHolidaysFetched(
    HolidaysFetched event,
    Emitter<HolidaysState> emit,
  ) async {
    emit(state.copyWith(status: HolidaysStatus.loading));

    await emit.forEach<List<Holiday>>(
        _holidayRepository.getHolidays(
          creator: FirebaseFirestore.instance.collection('admin').doc(
                event.creator,
              ),
          date: state.date ?? DateTime.now(),
        ),
        onData: (holidays) => state.copyWith(
              holidays: holidays,
              status: HolidaysStatus.success,
            ),
        onError: (_, __) {
          print(_);
          return state.copyWith(
            status: HolidaysStatus.failure,
          );
        });
  }

  void _onHolidaysDateChanged(
    HolidaysDateChanged event,
    Emitter<HolidaysState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  final HolidayRepository _holidayRepository;
}
