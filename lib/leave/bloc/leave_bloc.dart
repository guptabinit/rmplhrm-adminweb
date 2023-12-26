import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leave_api/leave_api.dart';
import 'package:leave_repository/leave_repository.dart';

part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  LeaveBloc({
    required LeaveRepository leaveRepository,
  })  : _leaveRepository = leaveRepository,
        super(const LeaveState()) {
    on<LeaveLoaded>(_onLeaveFetched);
    on<SelectedLeave>(_onSelectedLeave);
    on<LeaveDateChanged>(_onDateChanged);
  }

  void _onDateChanged(
    LeaveDateChanged event,
    Emitter<LeaveState> emit,
  ) {
    emit(
      state.copyWith(
        date: event.date,
      ),
    );
  }

  void _onSelectedLeave(
    SelectedLeave event,
    Emitter<LeaveState> emit,
  ) {
    emit(
      state.copyWith(
        selectedLeave: event.leave,
      ),
    );
  }

  Future<void> _onLeaveFetched(
    LeaveLoaded event,
    Emitter<LeaveState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LeaveStatus.loading,
      ),
    );
    await emit.forEach<List<Leave>>(
      _leaveRepository.getLeaves(
        under: event.under,
        date: state.date!,
      ),
      onData: (leaves) => state.copyWith(
        status: LeaveStatus.success,
        leaves: leaves,
      ),
      onError: (_, __) {
        print('EEEEEEEEEEEEEEEEEE $_');
        return state.copyWith(
          status: LeaveStatus.failure,
        );
      },
    );
  }

  final LeaveRepository _leaveRepository;
}
