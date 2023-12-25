import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:equatable/equatable.dart';
import 'package:live_location_api/live_location_api.dart';
import 'package:live_location_repository/live_location_repository.dart';

part 'live_location_event.dart';
part 'live_location_state.dart';

class LiveLocationBloc extends Bloc<LiveLocationEvent, LiveLocationState> {
  LiveLocationBloc({
    required LiveLocationRepository repository,
  })  : _repository = repository,
        super(const LiveLocationState()) {
    on<LiveLocationLoaded>(_onLiveLocationLoaded);
  }

  Future<void> _onLiveLocationLoaded(
    LiveLocationLoaded event,
    Emitter<LiveLocationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LiveLocationStatus.loading,
      ),
    );

    await emit.forEach(
      _repository.lastLocation(
        userId: event.employee.uid!,
      ),
      onData: (location) => state.copyWith(
        status: LiveLocationStatus.success,
        location: location,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: LiveLocationStatus.failure,
      ),
    );
  }

  final LiveLocationRepository _repository;
}
