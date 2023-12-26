import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_api/leave_api.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/leave_detail/bloc/leave_detail_bloc.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

final applicationList = [
  'Approve',
  'Disapprove',
  'Pending',
];

String _applicationStatus = 'Pending';

class LeaveDetailView extends StatelessWidget {
  const LeaveDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) {
        context.read<LeaveBloc>().add(
              const SelectedLeave(
                Leave.empty,
              ),
            );
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          titleSpacing: 0,
          iconTheme: const IconThemeData(
            color: whiteColor,
          ),
          title: const Text(
            'Leave Detail',
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
          margin: const EdgeInsets.only(top: 0),
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
            child: BlocBuilder<LeaveDetailBloc, LeaveDetailState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case LeaveDetailStatus.initial:
                  case LeaveDetailStatus.loading:
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case LeaveDetailStatus.success:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.heightBox,
                        Row(
                          children: [
                            Container(
                              height: mq.width * 0.3,
                              width: mq.width * 0.25,
                              decoration: BoxDecoration(
                                color: lightGreyColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: state.employee.profilePic != null
                                  ? CachedNetworkImage(
                                      imageUrl: '${state.employee.profilePic}',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (
                                        _,
                                        __,
                                        downloadProgress,
                                      ) =>
                                          Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      errorWidget: (_, __, ___) => const Center(
                                        child: Icon(Icons.error),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            16.widthBox,
                            Expanded(
                              child: SizedBox(
                                height: mq.width * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      '${state.employee.firstName} ${state.employee.lastName}',
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${state.employee.designation}',
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'EID: ${state.employee.eid}',
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        12.heightBox,
                        const Divider(
                          thickness: 1,
                          color: borderColor,
                        ),
                        12.heightBox,
                        const Text(
                          'Leave Details:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        16.heightBox,
                        Row(
                          children: [
                            const Text(
                              'Leave type: ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${state.leave.leaveType?.capitalize()}',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.heightBox,
                        Row(
                          children: [
                            const Text(
                              'Applied on: ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${state.leave.createdAt?.date}',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.heightBox,
                        Row(
                          children: [
                            const Text(
                              'Single/Multiple Days: ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.leave.toDate != null
                                    ? 'Multiple Days'
                                    : 'Single Day',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.heightBox,
                        Row(
                          children: [
                            Text(
                              state.leave.toDate != null
                                  ? 'From date: '
                                  : 'Date: ',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.leave.date.date,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.heightBox,
                        if (state.leave.toDate != null) ...[
                          Row(
                            children: [
                              const Text(
                                'To date: ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  state.leave.toDate.date,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          12.heightBox,
                        ],
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Reason: ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.leave.reason ?? 'N/A',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        12.heightBox,
                        const Divider(
                          thickness: 1,
                          color: borderColor,
                        ),
                        12.heightBox,
                        RadioListTile(
                          title: const Text('Approve'),
                          value: applicationList[0],
                          groupValue: _applicationStatus,
                          onChanged: (value) {},
                        ),
                        RadioListTile(
                          title: const Text('Disapprove'),
                          value: applicationList[1],
                          groupValue: _applicationStatus,
                          onChanged: (value) {},
                        ),
                        RadioListTile(
                          title: const Text('Pending'),
                          value: applicationList[2],
                          groupValue: _applicationStatus,
                          onChanged: (value) {},
                        ),
                        16.heightBox,
                        Row(
                          children: [
                            const Text(
                              'Application Status: ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${state.leave.status?.capitalize()}',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.heightBox,
                        //fields
                        const Text(
                          'Admin\'s Reason (if any)',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        8.heightBox,
                        const CustomTextFormField(
                          text: 'Enter a reason (if any)',
                          maxLines: 5,
                        ),
                        12.heightBox,
                        MainButton(
                          title: 'Update Leave Response',
                          onTap: () {},
                        ),
                        24.heightBox,
                      ],
                    );
                  case LeaveDetailStatus.failure:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Text(
                              'Something went wrong!',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.error,
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<LeaveDetailBloc>().add(
                                      LeaveDetailLoaded(
                                        context
                                            .read<LeaveBloc>()
                                            .state
                                            .selectedLeave
                                            .id!,
                                      ),
                                    );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
