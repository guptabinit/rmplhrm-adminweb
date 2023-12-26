import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:equatable/equatable.dart';
import 'package:probation_api/probation_api.dart';
import 'package:probation_repository/probation_repository.dart';

part 'probation_event.dart';
part 'probation_state.dart';

class ProbationBloc extends Bloc<ProbationEvent, ProbationState> {
  ProbationBloc({
    required ProbationRepository repository,
  })  : _repository = repository,
        super(const ProbationState()) {
    on<ProbationEmployeesFetched>(_onProbationEmployeesFetched);
    on<RefreshProbationEmployees>(_onRefreshProbationEmployees);
    on<RemoveFromProbation>(_onRemoveFromProbation);
  }

  Future<void> _onProbationEmployeesFetched(
    ProbationEmployeesFetched event,
    Emitter<ProbationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProbationStatus.loading,
      ),
    );
    await emit.forEach(
      _repository.getProbationEmployees(
        creator: event.creator,
      ),
      onData: (data) => state.copyWith(
        status: ProbationStatus.success,
        employees: data.toList(),
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: ProbationStatus.failure,
      ),
    );
  }

  Future<void> _onRefreshProbationEmployees(
    RefreshProbationEmployees event,
    Emitter<ProbationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProbationStatus.loading,
        employees: [],
      ),
    );
    await emit.forEach(
      _repository.getProbationEmployees(
        creator: event.creator,
      ),
      onData: (data) => state.copyWith(
        status: ProbationStatus.success,
        employees: data.toList(),
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: ProbationStatus.failure,
      ),
    );
  }

  Future<void> _onRemoveFromProbation(
    RemoveFromProbation event,
    Emitter<ProbationState> emit,
  ) async {
    emit(
      state.copyWith(
        removeStatus: RemoveProbationStatus.loading,
      ),
    );
    try {
      await _repository.removeFromProbation(event.id);
      emit(
        state.copyWith(
          removeStatus: RemoveProbationStatus.success,
        ),
      );
    } on RemoveFromProbationFailure catch (e) {
      emit(
        state.copyWith(
          removeStatus: RemoveProbationStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          removeStatus: RemoveProbationStatus.failure,
        ),
      );
    }
  }

  final ProbationRepository _repository;
}
