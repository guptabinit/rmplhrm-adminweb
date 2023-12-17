import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:holiday_repository/holiday_repository.dart';

part 'edit_holiday_state.dart';

class EditHolidayCubit extends Cubit<EditHolidayState> {
  EditHolidayCubit({
    required HolidayRepository holidayRepository,
  })  : _holidayRepository = holidayRepository,
        super(const EditHolidayState());

  void dateChanged(String value) {
    final date = Date.dirty(value);
    emit(
      state.copyWith(
        date: date,
        isValid: Formz.validate(
          [
            date,
            state.title,
          ],
        ),
      ),
    );
  }

  void titleChanged(String value) {
    final title = HolidayTitle.dirty(value);
    emit(
      state.copyWith(
        title: title,
        isValid: Formz.validate(
          [
            state.date,
            title,
          ],
        ),
      ),
    );
  }

  Future<void> updateHoliday({
    required String id,
    required String creator,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _holidayRepository.updateHoliday(
        id: id,
        creator: creator,
        date: DateTime.parse(state.date.value!),
        title: state.title.value!,
      );

      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
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

  final HolidayRepository _holidayRepository;
}
