import 'package:attendance_repository/attendance_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'edit_attendance_state.dart';

class EditAttendanceCubit extends Cubit<EditAttendanceState> {
  EditAttendanceCubit({
    required AttendanceRepository repository,
  })  : _repository = repository,
        super(const EditAttendanceState());

  void punchedInChanged(
    String value,
  ) {
    final punchIn = Date.dirty(value);
    emit(
      state.copyWith(
        punchIn: punchIn,
        isValid: Formz.validate(
          [
            punchIn,
            state.punchOut,
          ],
        ),
      ),
    );
  }

  void punchedOutChanged(
    String value,
  ) {
    final punchOut = Date.dirty(value);
    emit(
      state.copyWith(
        punchOut: punchOut,
        isValid: Formz.validate(
          [
            state.punchIn,
            punchOut,
          ],
        ),
      ),
    );
  }

  Future<void> onUpdate({
    required String punchedBy,
    required DateTime createdAt,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _repository.updateAttendance(
        punchedBy: punchedBy,
        createdAt: createdAt,
        punchIn: DateTime.parse(state.punchIn.value!),
        punchOut: DateTime.parse(state.punchOut.value!),
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.code,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }

  final AttendanceRepository _repository;
}
