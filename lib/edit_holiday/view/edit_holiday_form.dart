import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/edit_holiday/edit_holiday.dart';
import 'package:rmpl_hrm_admin/holidays/holidays.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class EditHolidayForm extends StatelessWidget {
  const EditHolidayForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditHolidayCubit, EditHolidayState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Holiday successfully updated.',
                ),
              ),
            );
        }
      },
      child: PopScope(
        canPop: true,
        onPopInvoked: (_) {
          context.read<HolidaysBloc>().add(
                const UnselectedHoliday(),
              );
        },
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            iconTheme: const IconThemeData(
              color: whiteColor,
            ),
            elevation: 0,
            titleSpacing: 0,
            title: const Text(
              'Edit Holiday',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 16),
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
                children: [
                  16.heightBox,
                  const _DateField(),
                  12.heightBox,
                  const _HolidayTitleField(),
                  16.heightBox,
                  const _AddHolidayButton(),
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

class _HolidayTitleField extends StatelessWidget {
  const _HolidayTitleField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Holiday title',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<EditHolidayCubit, EditHolidayState>(
          buildWhen: (previous, current) => previous.title != current.title,
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: state.title.value,
              text: 'Enter a title for the holiday',
              onChanged: (title) =>
                  context.read<EditHolidayCubit>().titleChanged(title),
              errorText: state.title.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Select the date',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<EditHolidayCubit, EditHolidayState>(
          buildWhen: (previous, current) => previous.date != current.date,
          builder: (context, state) {
            final controller = TextEditingController(
              text: state.date.value.parseDate(),
            );
            return CustomTextFormField(
              controller: controller,
              text: 'Date',
              suffixIcon: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.calendar_today,
                  color: primaryColor,
                ),
              ),
              onTap: () async {
                final dt = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (dt != null && context.mounted) {
                  context.read<EditHolidayCubit>().dateChanged(dt.toString());
                }
              },
              onChanged: (date) {
                context.read<EditHolidayCubit>().dateChanged(date);
              },
              errorText: state.date.displayError?.text,
              readOnly: true,
            );
          },
        ),
      ],
    );
  }
}

class _AddHolidayButton extends StatelessWidget {
  const _AddHolidayButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditHolidayCubit, EditHolidayState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : MainButton(
                title: 'Update Holiday',
                onTap: !state.isValid
                    ? null
                    : () => context.read<EditHolidayCubit>().updateHoliday(
                          id: context
                              .read<HolidaysBloc>()
                              .state
                              .selectedHoliday!
                              .id!,
                          creator: context.read<AppBloc>().state.user.id,
                        ),
              );
      },
    );
  }
}
