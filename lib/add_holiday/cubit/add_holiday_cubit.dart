import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:holiday_repository/holiday_repository.dart';

part 'add_holiday_state.dart';

class AddHolidayCubit extends Cubit<AddHolidayState> {
  AddHolidayCubit({
    required HolidayRepository holidayRepository,
  })  : _holidayRepository = holidayRepository,
        super(const AddHolidayState());

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

  Future<void> addHoliday({
    required String creator,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      final date = DateTime.parse(state.date.value!);

      final unixDate = DateTime(
            date.year,
            date.month,
            date.day,
          ).millisecondsSinceEpoch ~/
          1000;

      final id = '$unixDate-$creator';

      final doc = FirebaseFirestore.instance.collection('holidays').doc(id);

      final holiday = Holiday(
        id: doc.id,
        creator: FirebaseFirestore.instance.collection('admin').doc(creator),
        createdAt: Timestamp.now().toDate(),
        date: Timestamp.fromDate(date).toDate(),
        title: state.title.value,
      );

      await _holidayRepository.createHoliday(holiday);

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
