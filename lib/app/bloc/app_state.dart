part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status, user];

  final AppStatus status;
  final User user;
}

extension AppStatusX on AppStatus {
  bool get isAuthenticated => this == AppStatus.authenticated;

  bool get isUnauthenticated => this == AppStatus.unauthenticated;
}
