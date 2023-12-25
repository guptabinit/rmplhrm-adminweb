part of 'employee_profile_bloc.dart';

sealed class EmployeeProfileEvent extends Equatable {
  const EmployeeProfileEvent();

  @override
  List<Object?> get props => [];
}

final class ToggleIsActiveEmployeeProfile extends EmployeeProfileEvent {
  const ToggleIsActiveEmployeeProfile({
    required this.id,
    required this.isActive,
  });

  final String id;
  final bool isActive;

  @override
  List<Object?> get props => [id, isActive];
}

final class DeleteEmployeeProfile extends EmployeeProfileEvent {
  const DeleteEmployeeProfile({
    required this.creator,
    required this.uid,
  });

  @override
  List<Object?> get props => [creator, uid];

  final String creator;
  final String uid;
}
