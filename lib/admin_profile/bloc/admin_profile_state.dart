part of 'admin_profile_bloc.dart';

enum AdminProfileStatus {
  initial,
  loading,
  success,
  failure,
}

final class AdminProfileState extends Equatable {
  const AdminProfileState({
    this.status = AdminProfileStatus.initial,
    this.admin = Admin.empty,
    this.errorMessage,
  });

  AdminProfileState copyWith({
    Admin? admin,
    AdminProfileStatus? status,
    String? errorMessage,
  }) {
    return AdminProfileState(
      status: status ?? this.status,
      admin: admin ?? this.admin,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, admin, errorMessage];

  final AdminProfileStatus status;
  final Admin admin;
  final String? errorMessage;
}

extension AdminProfileStatusX on AdminProfileStatus {
  bool get isInitial => this == AdminProfileStatus.initial;

  bool get isLoading => this == AdminProfileStatus.loading;

  bool get isSuccess => this == AdminProfileStatus.success;

  bool get isFailure => this == AdminProfileStatus.failure;
}
