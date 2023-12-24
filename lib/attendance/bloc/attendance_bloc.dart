import 'package:attendance_api/attendance_api.dart';
import 'package:attendance_repository/attendance_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc({
    required AttendanceRepository attendanceRepository,
  })  : _attendanceRepository = attendanceRepository,
        super(AttendanceState()) {
    on<AttendanceLoaded>(_onAttendanceLoaded);
    on<AttendanceRefresh>(_onAttendanceRefresh);
    on<AttendanceRevoke>(_onAttendanceRevoke);
    on<AttendanceDateChanged>(_onAttendanceDateChanged);
    on<SelectedAttendance>(_onSelectedAttendance);
  }

  Future<void> _onAttendanceLoaded(
    AttendanceLoaded event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AttendanceStatus.loading,
      ),
    );
    await emit.forEach(
      _attendanceRepository.getAttendances(
        creator: event.creator,
        createAt: state.date!,
      ),
      onData: (attendances) => state.copyWith(
        status: AttendanceStatus.success,
        attendances: attendances,
      ),
      onError: (err, __) => state.copyWith(
        status: AttendanceStatus.failure,
        errorMessage: err.toString(),
      ),
    );
  }

  Future<void> _onAttendanceRefresh(
    AttendanceRefresh event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AttendanceStatus.loading,
        attendances: [],
      ),
    );
    await emit.forEach(
      _attendanceRepository.getAttendances(
        creator: event.creator,
        createAt: state.date!,
      ),
      onData: (attendances) => state.copyWith(
        status: AttendanceStatus.success,
        attendances: attendances,
      ),
      onError: (err, __) => state.copyWith(
        status: AttendanceStatus.failure,
        errorMessage: err.toString(),
      ),
    );
  }

  Future<void> _onAttendanceRevoke(
    AttendanceRevoke event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(
      state.copyWith(
        revokeStatus: AttendanceRevokeStatus.loading,
      ),
    );
    try {
      await _attendanceRepository.revokeAttendance(
        punchedBy: event.punchedBy,
        createdAt: event.createdAt,
      );
      emit(
        state.copyWith(
          revokeStatus: AttendanceRevokeStatus.success,
        ),
      );
    } on RevokeAttendanceFailure catch (e) {
      emit(
        state.copyWith(
          revokeStatus: AttendanceRevokeStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          revokeStatus: AttendanceRevokeStatus.failure,
        ),
      );
    }
  }

  void _onSelectedAttendance(
    SelectedAttendance event,
    Emitter<AttendanceState> emit,
  ) {
    emit(
      state.copyWith(
        selectedAttendance: event.attendance,
      ),
    );
  }

  void _onAttendanceDateChanged(
    AttendanceDateChanged event,
    Emitter<AttendanceState> emit,
  ) {
    emit(
      state.copyWith(
        date: event.date,
      ),
    );
  }

  final AttendanceRepository _attendanceRepository;
}
