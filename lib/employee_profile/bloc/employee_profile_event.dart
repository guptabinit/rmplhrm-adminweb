part of 'employee_profile_bloc.dart';

sealed class EmployeeProfileEvent extends Equatable {
  const EmployeeProfileEvent();

  @override
  List<Object?> get props => [];
}

final class LoadedEmployeeProfile extends EmployeeProfileEvent {
  const LoadedEmployeeProfile(this.uid);

  @override
  List<Object?> get props => [uid];

  final String uid;
}
