import 'package:bloc/bloc.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';

part 'employee_profile_event.dart';
part 'employee_profile_state.dart';

class EmployeeProfileBloc
    extends Bloc<EmployeeProfileEvent, EmployeeProfileState> {
  EmployeeProfileBloc({
    required EmployeeRepository repository,
  })  : _repository = repository,
        super(const EmployeeProfileState()) {
    on<ToggleIsActiveEmployeeProfile>(_onToggleIsActiveEmployeeProfile);
  }

  Future<void> _onToggleIsActiveEmployeeProfile(
    ToggleIsActiveEmployeeProfile event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EmployeeProfileStatus.loading,
      ),
    );
    try {
      await _repository.toggleEmployeeActive(
        id: event.id,
        isActive: event.isActive,
      );
      emit(
        state.copyWith(
          status: EmployeeProfileStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: EmployeeProfileStatus.failure,
        ),
      );
    }
  }

  final EmployeeRepository _repository;
}
