part of 'live_location_bloc.dart';

enum LiveLocationStatus {
  initial,
  loading,
  success,
  failure,
}

final class LiveLocationState extends Equatable {
  const LiveLocationState({
    this.status = LiveLocationStatus.initial,
    this.location,
  });

  LiveLocationState copyWith({
    LiveLocationStatus? status,
    Location? location,
  }) {
    return LiveLocationState(
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [
        status,
        location,
      ];

  final LiveLocationStatus status;
  final Location? location;
}

extension LiveLocationStatusX on LiveLocationStatus {
  bool get isInitial => this == LiveLocationStatus.initial;

  bool get isLoading => this == LiveLocationStatus.loading;

  bool get isSuccess => this == LiveLocationStatus.success;

  bool get isFailure => this == LiveLocationStatus.failure;
}
