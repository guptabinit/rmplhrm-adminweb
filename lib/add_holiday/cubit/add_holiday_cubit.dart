import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm_admin/models/holiday_model.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

part 'add_holiday_state.dart';

class AddHolidayCubit extends Cubit<AddHolidayState> {
  AddHolidayCubit() : super(const AddHolidayState());

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

  void addHoliday() async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      final doc = FirebaseFirestore.instance.collection('holidays').doc();

      final holiday = HolidayModel(
        id: doc.id,
        createdAt: Timestamp.now().toDate(),
        date: Timestamp.fromDate(DateTime.parse(state.date.value!)).toDate(),
        title: state.title.value!,
      );

      await doc.set(holiday.toJson());

      final storageRef = FirebaseStorage.instance.ref().child("admin/hhhhhhh");
      try {
        final listResult = await storageRef.listAll();
        listResult.log();
      } on FirebaseException catch (e) {
        // Caught an exception from Firebase.
        "Failed with error '${e.code}': ${e.message}".log();
      }

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
}
