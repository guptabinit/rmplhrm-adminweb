import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'holidays_event.dart';
part 'holidays_state.dart';

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  HolidaysBloc() : super(HolidaysInitial()) {
    on<HolidaysEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
