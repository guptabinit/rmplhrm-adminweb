import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:leave_api/leave_api.dart';
import 'package:leave_repository/leave_repository.dart';

part 'update_leave_detail_state.dart';

class UpdateLeaveDetailCubit extends Cubit<UpdateLeaveDetailState> {
  UpdateLeaveDetailCubit({
    required LeaveRepository repository,
  })  : _repository = repository,
        super(const UpdateLeaveDetailState());

  void onLeaveStatusChanged(String? value) {
    final leaveStatus = LeaveStatus.dirty(value);
    emit(
      state.copyWith(
        leaveStatus: leaveStatus,
        isValid: Formz.validate(
          [
            leaveStatus,
            state.reason,
          ],
        ),
      ),
    );
  }

  void onLeaveReasonChanged(String? value) {
    final reason = Reason.dirty(value);
    emit(
      state.copyWith(
        reason: reason,
        isValid: Formz.validate(
          [
            state.leaveStatus,
            reason,
          ],
        ),
      ),
    );
  }

  Future<void> updateLeaveDetail(String id) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _repository.updateLeave(
        id: id,
        status: state.leaveStatus.value,
        reason: state.reason.value,
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on UpdateLeaveFailure catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  final LeaveRepository _repository;
}
