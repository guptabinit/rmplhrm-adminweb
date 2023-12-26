import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:leave_api/leave_api.dart';
import 'package:leave_repository/leave_repository.dart';

part 'leave_detail_event.dart';
part 'leave_detail_state.dart';

class LeaveDetailBloc extends Bloc<LeaveDetailEvent, LeaveDetailState> {
  LeaveDetailBloc({
    required LeaveRepository leaveRepository,
    required EmployeeRepository employeeRepository,
  })  : _leaveRepository = leaveRepository,
        _employeeRepository = employeeRepository,
        super(const LeaveDetailState()) {
    on<LeaveDetailLoaded>(_onLeaveDetailLoaded);
  }

  Future<void> _onLeaveDetailLoaded(
    LeaveDetailLoaded event,
    Emitter<LeaveDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LeaveDetailStatus.initial,
      ),
    );
    try {
      final leave = await _leaveRepository.getLeave(
        id: event.id,
      );

      final employee = await _employeeRepository.getEmployee(
        leave.uid!.id,
      );

      emit(
        state.copyWith(
          status: LeaveDetailStatus.success,
          leave: leave,
          employee: employee,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LeaveDetailStatus.failure,
        ),
      );
    }
  }

  final LeaveRepository _leaveRepository;
  final EmployeeRepository _employeeRepository;
}
