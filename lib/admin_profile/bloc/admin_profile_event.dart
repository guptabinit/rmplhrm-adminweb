part of 'admin_profile_bloc.dart';

sealed class AdminProfileEvent extends Equatable {
  const AdminProfileEvent();

  @override
  List<Object?> get props => [];
}

final class AdminProfileLoaded extends AdminProfileEvent {
  const AdminProfileLoaded(this.uid);

  @override
  List<Object?> get props => [uid];

  final String uid;
}
