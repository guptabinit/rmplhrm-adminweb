part of 'live_location_bloc.dart';

sealed class LiveLocationEvent extends Equatable {
  const LiveLocationEvent();

  @override
  List<Object?> get props => [];
}

final class LiveLocationLoaded extends LiveLocationEvent {
  const LiveLocationLoaded(this.employee);

  @override
  List<Object?> get props => [employee];

  final Employee employee;
}
