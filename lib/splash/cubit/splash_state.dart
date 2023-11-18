part of 'splash_cubit.dart';

enum SplashStatus {
  loading,
  loaded,
}

final class SplashState extends Equatable {
  const SplashState({
    this.status = SplashStatus.loading,
  });

  SplashState copyWith({
    SplashStatus? status,
  }) =>
      SplashState(
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status];

  final SplashStatus status;
}
