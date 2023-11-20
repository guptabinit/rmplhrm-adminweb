import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/components/manage_leave_card.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class LeaveView extends StatelessWidget {
  const LeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  BlocBuilder<LeaveBloc, LeaveState>(
                    buildWhen: (previous, current) =>
                        previous.date != current.date,
                    builder: (context, state) {
                      return Text(
                        state.date.monthDate,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  12.widthBox,
                  BlocBuilder<LeaveBloc, LeaveState>(
                    builder: (context, state) {
                      return SecondaryButton(
                        title: 'Change Duration',
                        onTap: () async {
                          final date = await showMonthPicker(
                            context: context,
                            initialDate: state.date,
                          );
                          if (date != null && context.mounted) {
                            context
                                .read<LeaveBloc>()
                                .add(LeaveDateChanged(date));
                          }
                        },
                        fontSize: 14,
                      );
                    },
                  ),
                ],
              ),
              12.heightBox,
              BlocBuilder<LeaveBloc, LeaveState>(
                builder: (context, state) {
                  final approvedCount = state.leaves
                      .where(
                        (element) =>
                            element.status?.toLowerCase() == 'approved',
                      )
                      .length;
                  final rejectedCount = state.leaves
                      .where(
                        (element) =>
                            element.status?.toLowerCase() == 'rejected',
                      )
                      .length;
                  final pendingCount = state.leaves
                      .where(
                        (element) => element.status?.toLowerCase() == 'pending',
                      )
                      .length;

                  return Text.rich(
                    TextSpan(
                      style: const TextStyle(height: 1.5),
                      children: [
                        TextSpan(
                          text: '$approvedCount Approved leave',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: greenColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: '$rejectedCount Rejected leave',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: redColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(text: '\n'),
                        TextSpan(
                          text: '$pendingCount Pending leave',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: textGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              8.heightBox,
              const Divider(
                color: textGreyColor,
              ),
              4.heightBox,
              BlocBuilder<LeaveBloc, LeaveState>(
                builder: (context, state) {
                  switch (state.status) {
                    case LeaveStatus.initial:
                    case LeaveStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case LeaveStatus.success:
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.leaves.length,
                          itemBuilder: (context, index) {
                            final leave = state.leaves[index];
                            return LeaveApplicationCard(leave: leave);
                          },
                        ),
                      );
                    case LeaveStatus.failure:
                      return const Text('Error');
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
