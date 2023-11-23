import 'package:admin_profile_api/admin_profile_api.dart';
import 'package:admin_profile_repository/admin_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_profile_event.dart';
part 'admin_profile_state.dart';

class AdminProfileBloc extends Bloc<AdminProfileEvent, AdminProfileState> {
  AdminProfileBloc({
    required AdminProfileRepository adminProfileRepository,
  })  : _adminProfileRepository = adminProfileRepository,
        super(const AdminProfileState()) {
    on<AdminProfileLoaded>(_onAdminProfileLoaded);
  }

  Future<void> _onAdminProfileLoaded(
    AdminProfileLoaded event,
    Emitter<AdminProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AdminProfileStatus.loading,
      ),
    );
    try {
      final admin = await _adminProfileRepository.getAdmin(event.uid);
      emit(
        state.copyWith(
          status: AdminProfileStatus.success,
          admin: admin,
        ),
      );
    } on AdminProfileNotFound catch (e) {
      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AdminProfileStatus.failure,
        ),
      );
    }
  }

  final AdminProfileRepository _adminProfileRepository;
}
