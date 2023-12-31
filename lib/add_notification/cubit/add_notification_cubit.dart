import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';

part 'add_notification_state.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit({
    required NotificationRepository notificationRepository,
  })  : _notificationRepository = notificationRepository,
        super(const AddNotificationState());

  void selectNotificationReceiver(String? value) {
    final receiver = NotificationReceiver.dirty(value);
    emit(
      state.copyWith(
        notificationReceiver: receiver,
        isValid: Formz.validate(
          [
            receiver,
            state.notificationType,
            state.message,
          ],
        ),
      ),
    );
  }

  void selectNotificationType(String? value) {
    final type = NotificationType.dirty(value);
    emit(
      state.copyWith(
        notificationType: type,
        isValid: Formz.validate(
          [
            state.notificationReceiver,
            type,
            state.message,
          ],
        ),
      ),
    );
  }

  void changeNotificationMessage(String? value) {
    final message = Message.dirty(value);
    emit(
      state.copyWith(
        message: message,
        isValid: Formz.validate(
          [
            state.notificationReceiver,
            state.notificationType,
            message,
          ],
        ),
      ),
    );
  }

  Future<void> addNotification({
    required String creator,
    required String branch,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    try {
      await _notificationRepository.createNotification(
        creator: creator,
        branch: branch,
        message: state.message.value!,
        type: state.notificationType.value!,
        receiver: state.notificationReceiver.value!,
        isVisible: true,
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on CreateNotificationFailure catch (e) {
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

  final NotificationRepository _notificationRepository;
}
