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
    on<DeleteEmployeeProfile>(_onDeleteEmployeeProfile);
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

  Future<void> _onDeleteEmployeeProfile(
    DeleteEmployeeProfile event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        deleteEmployeeProfileStatus: DeleteEmployeeProfileStatus.loading,
      ),
    );
    try {
      await _repository.deleteEmployee(
        creator: event.creator,
        uid: event.uid,
      );
      emit(
        state.copyWith(
          deleteEmployeeProfileStatus: DeleteEmployeeProfileStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteEmployeeProfileStatus: DeleteEmployeeProfileStatus.failure,
        ),
      );
    }
  }

  final EmployeeRepository _repository;
}
