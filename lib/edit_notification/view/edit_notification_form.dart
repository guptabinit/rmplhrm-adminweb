import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
// import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';
import 'package:rmpl_hrm_admin/admin_profile/admin_profile.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/edit_notification/edit_notification.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EditNotificationForm extends StatelessWidget {
  const EditNotificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditNotificationCubit, EditNotificationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMessage ?? 'Something went wrong!',
                ),
              ),
            );
        }
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Notification added successfully!',
                ),
              ),
            );
          Navigator.of(context).pop();
        }
      },
      child: PopScope(
        canPop: true,
        onPopInvoked: (_) {
          context.read<NotificationsBloc>().add(
                const DeselectedNotification(),
              );
        },
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            titleSpacing: 0,
            title: const Text(
              'Edit Notification',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
            iconTheme: const IconThemeData(
              color: whiteColor,
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            margin: const EdgeInsets.only(),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  16.heightBox,
                  const _ReceiverDropdownField(),
                  12.heightBox,
                  const _NotificationTypeDropdownField(),
                  12.heightBox,
                  const _NotificationMessageTextarea(),
                  16.heightBox,
                  const _AddNotificationButton(),
                  24.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReceiverDropdownField extends StatelessWidget {
  const _ReceiverDropdownField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Receiver',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<EditNotificationCubit, EditNotificationState>(
          buildWhen: (previous, current) =>
              previous.notificationReceiver != current.notificationReceiver,
          builder: (context, state) {
            return DropdownButtonFormField(
              hint: const Text('Select Receiver'),
              value: ['All']
                      .map((el) => el.toLowerCase())
                      .contains(state.notificationReceiver.value?.toLowerCase())
                  ? state.notificationReceiver.value?.toLowerCase()
                  : '',
              items: ['All']
                  .map(
                    (el) => DropdownMenuItem(
                      value: el.toLowerCase(),
                      child: Text(el),
                    ),
                  )
                  .toList(),
              onChanged: (String? value) => context
                  .read<EditNotificationCubit>()
                  .selectNotificationReceiver(value),
            );
          },
        ),
      ],
    );
  }
}

class _NotificationTypeDropdownField extends StatelessWidget {
  const _NotificationTypeDropdownField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Notification type',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<EditNotificationCubit, EditNotificationState>(
          buildWhen: (previous, current) =>
              previous.notificationType != current.notificationType,
          builder: (context, state) {
            return DropdownButtonFormField<String>(
              value: ['Common', 'Urgent']
                      .map((el) => el.toLowerCase())
                      .contains(state.notificationType.value?.toLowerCase())
                  ? state.notificationType.value?.toLowerCase()
                  : '',
              hint: const Text('Select Notification type'),
              items: ['Common', 'Urgent']
                  .map(
                    (el) => DropdownMenuItem<String>(
                      value: el.toLowerCase(),
                      child: Text(el),
                    ),
                  )
                  .toList(),
              onChanged: (String? value) => context
                  .read<EditNotificationCubit>()
                  .selectNotificationType(value),
              decoration: InputDecoration(
                errorText: state.notificationType.displayError?.text,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _NotificationMessageTextarea extends StatelessWidget {
  const _NotificationMessageTextarea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Notification Message',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<EditNotificationCubit, EditNotificationState>(
          buildWhen: (previous, current) => previous.message != current.message,
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: state.message.value,
              text: 'Notification Message',
              maxLines: 8,
              errorText: state.message.displayError?.text,
              onChanged: (String? value) => context
                  .read<EditNotificationCubit>()
                  .changeNotificationMessage(value),
            );
          },
        ),
      ],
    );
  }
}

class _AddNotificationButton extends StatelessWidget {
  const _AddNotificationButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNotificationCubit, EditNotificationState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : MainButton(
                title: 'Update Notification',
                onTap: !state.isValid
                    ? null
                    : () {
                        context
                            .read<EditNotificationCubit>()
                            .updateNotification(
                              id: context
                                  .read<NotificationsBloc>()
                                  .state
                                  .selectedNotification!
                                  .id!,
                              creator: context.read<AppBloc>().state.user.id,
                              branch: context
                                      .read<AdminProfileBloc>()
                                      .state
                                      .admin
                                      .isNotEmpty
                                  ? context
                                      .read<AdminProfileBloc>()
                                      .state
                                      .admin
                                      .branch!
                                  : '',
                            );
                      },
              );
      },
    );
  }
}
