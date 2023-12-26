import 'package:attendance_api/attendance_api.dart';
import 'package:attendance_repository/attendance_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_count_event.dart';

part 'attendance_count_state.dart';

class AttendanceCountBloc
    extends Bloc<AttendanceCountEvent, AttendanceCountState> {
  AttendanceCountBloc({required AttendanceRepository repository})
      : _repository = repository,
        super(const AttendanceCountState()) {
    on<AttendanceCountLoaded>(_onAttendanceCountLoaded);
  }

  Future<void> _onAttendanceCountLoaded(
    AttendanceCountLoaded event,
    Emitter<AttendanceCountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AttendanceCountStatus.loading,
      ),
    );
    await emit.forEach(
      _repository.countAttendances(creator: event.creator),
      onData: (attendanceCount) => state.copyWith(
        status: AttendanceCountStatus.success,
        attendanceCount: attendanceCount,
      ),
      onError: (_, __) => state.copyWith(
        status: AttendanceCountStatus.failure,
      ),
    );
  }

  final AttendanceRepository _repository;
}
