import 'package:bloc/bloc.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:probation_repository/probation_repository.dart';

part 'employee_profile_event.dart';
part 'employee_profile_state.dart';

class EmployeeProfileBloc
    extends Bloc<EmployeeProfileEvent, EmployeeProfileState> {
  EmployeeProfileBloc({
    required EmployeeRepository employeeRepository,
    required ProbationRepository probationRepository,
  })  : _employeeRepository = employeeRepository,
        _probationRepository = probationRepository,
        super(const EmployeeProfileState()) {
    on<ToggleIsActiveEmployeeProfile>(_onToggleIsActiveEmployeeProfile);
    on<DeleteEmployeeProfile>(_onDeleteEmployeeProfile);
    on<MarkEmployeeAsProbation>(_onMarkEmployeeAsProbation);
    on<RemoveEmployeeFromProbation>(_onRemoveEmployeeFromProbation);
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
      await _employeeRepository.toggleEmployeeActive(
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
      await _employeeRepository.deleteEmployee(
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

  Future<void> _onMarkEmployeeAsProbation(
    MarkEmployeeAsProbation event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        markProbationEmployeeStatus: MarkProbationEmployeeStatus.loading,
      ),
    );
    try {
      await _probationRepository.addToProbation(
        id: event.uid,
        date: event.date,
      );
      emit(
        state.copyWith(
          markProbationEmployeeStatus: MarkProbationEmployeeStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          markProbationEmployeeStatus: MarkProbationEmployeeStatus.failure,
        ),
      );
    }
  }

  Future<void> _onRemoveEmployeeFromProbation(
    RemoveEmployeeFromProbation event,
    Emitter<EmployeeProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        removeProbationEmployeeStatus: RemoveProbationEmployeeStatus.loading,
      ),
    );
    try {
      await _probationRepository.removeFromProbation(event.uid);
      emit(
        state.copyWith(
          removeProbationEmployeeStatus: RemoveProbationEmployeeStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          removeProbationEmployeeStatus: RemoveProbationEmployeeStatus.failure,
        ),
      );
    }
  }

  final EmployeeRepository _employeeRepository;
  final ProbationRepository _probationRepository;
}
