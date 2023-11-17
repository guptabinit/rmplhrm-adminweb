import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/components/holiday_container.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/holidays/bloc/holidays_bloc.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class HolidaysView extends StatelessWidget {
  const HolidaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Calendar.svg',
                    colorFilter: const ColorFilter.mode(
                      primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.widthBox,
                  BlocBuilder<HolidaysBloc, HolidaysState>(
                    builder: (context, state) {
                      return Text(
                        state.date.date,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  12.widthBox,
                  BlocBuilder<HolidaysBloc, HolidaysState>(
                    builder: (context, state) {
                      return SecondaryButton(
                        title: "Change Duration",
                        onTap: () async {
                          final date = await showMonthPicker(
                            context: context,
                            initialDate: state.date,
                          );
                          if (date != null && context.mounted) {
                            context.read<HolidaysBloc>().add(
                                  HolidaysDateChanged(date),
                                );
                          }
                        },
                        fontSize: 14,
                      );
                    },
                  ),
                ],
              ),
              16.heightBox,
              const Text(
                'Holidays other then Sat/Sun',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  // color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              BlocBuilder<HolidaysBloc, HolidaysState>(
                builder: (context, state) {
                  return Text(
                    '${state.holidays.length} holidays this month',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: textGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
              const Divider(
                color: textGreyColor,
              ),
              BlocBuilder<HolidaysBloc, HolidaysState>(
                builder: (context, state) {
                  switch (state.status) {
                    case HolidaysStatus.initial:
                    case HolidaysStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case HolidaysStatus.failure:
                      return const Text("Error");
                    case HolidaysStatus.success:
                      return Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(bottom: 16),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.holidays.length,
                          separatorBuilder: (_, __) => 12.heightBox,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            final holiday = state.holidays[index];
                            return HolidayCardWidget(holiday: holiday);
                          },
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
