import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/employee_details/bloc/employee_details_bloc.dart';
import 'package:rmpl_hrm_admin/employee_profile/bloc/employee_profile_bloc.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class EmployeeProfileView extends StatelessWidget {
  const EmployeeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return PopScope(
      canPop: true,
      onPopInvoked: (_) {
        context
            .read<EmployeeDetailsBloc>()
            .add(const EmployeeDetailsDeselected());
        context.read<UpdateEmployeeProfileCubit>().reset();
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
          titleSpacing: 0,
          title: const Text(
            "Employee's Profile",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: [
            BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
              builder: (context, state) {
                return state.employeeDetailStatus.isSuccess
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            UpdateEmployeeProfilePage.route(
                              context.read<UpdateEmployeeProfileCubit>(),
                              context.read<EmployeeDetailsBloc>(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            color: primaryColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
            16.widthBox,
          ],
        ),
        body: BlocConsumer<EmployeeDetailsBloc, EmployeeDetailsState>(
          listenWhen: (previous, current) =>
              previous.employeeDetailStatus != current.employeeDetailStatus,
          listener: (context, state) {
            if (state.employeeDetailStatus.isSuccess) {
              final employee = state.selectedEmployee;

              context.read<UpdateEmployeeProfileCubit>()
                ..employeeIdChanged(employee.eid)
                ..passwordChanged(employee.password)
                ..firstNameChanged(employee.firstName)
                ..lastNameChanged(employee.lastName)
                ..dateOfBirthChanged(employee.dob.toString())
                ..designationChanged(employee.designation)
                ..dateJoinedChanged(employee.dateJoined.toString())
                ..fathersNameChanged(employee.fathersName)
                ..addressChanged(employee.address)
                ..emailChanged(employee.email)
                ..aadharCardChanged(employee.aadharNumber)
                ..panCardChanged(employee.panNumber)
                ..basicSalaryChanged(employee.basicSalary)
                ..hraChanged(employee.hra)
                ..fieldWorkAllowanceChanged(employee.fieldWorkAllowance);
            }
          },
          buildWhen: (previous, current) =>
              previous.employeeDetailStatus != current.employeeDetailStatus,
          builder: (context, state) {
            switch (state.employeeDetailStatus) {
              case EmployeeDetailStatus.initial:
              case EmployeeDetailStatus.loading:
                return const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              case EmployeeDetailStatus.success:
                return Container(
                  width: double.infinity,
                  height: double.infinity,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: mq.width * 0.3,
                                    width: mq.width * 0.25,
                                    decoration: BoxDecoration(
                                      color: lightGreyColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: BlocBuilder<EmployeeDetailsBloc,
                                        EmployeeDetailsState>(
                                      buildWhen: (previous, current) =>
                                          previous.selectedEmployee !=
                                          current.selectedEmployee,
                                      builder: (context, state) {
                                        return CachedNetworkImage(
                                          imageUrl:
                                              '${state.selectedEmployee.profilePic}',
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                            child: Icon(
                                              Icons.error,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  16.widthBox,
                                  Expanded(
                                    child: SizedBox(
                                      height: mq.width * 0.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Spacer(),
                                          BlocBuilder<EmployeeDetailsBloc,
                                              EmployeeDetailsState>(
                                            buildWhen: (previous, current) =>
                                                previous.selectedEmployee !=
                                                current.selectedEmployee,
                                            builder: (context, state) {
                                              return Text(
                                                '${state.selectedEmployee.firstName} ${state.selectedEmployee.lastName}',
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              );
                                            },
                                          ),
                                          const Spacer(),
                                          BlocBuilder<EmployeeDetailsBloc,
                                              EmployeeDetailsState>(
                                            buildWhen: (previous, current) =>
                                                previous.selectedEmployee !=
                                                current.selectedEmployee,
                                            builder: (context, state) {
                                              return Text(
                                                '${state.selectedEmployee.designation}',
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              );
                                            },
                                          ),
                                          const Spacer(),
                                          BlocBuilder<EmployeeDetailsBloc,
                                              EmployeeDetailsState>(
                                            buildWhen: (previous, current) =>
                                                previous.selectedEmployee !=
                                                current.selectedEmployee,
                                            builder: (context, state) {
                                              return Text(
                                                'Employee since ${state.selectedEmployee.dateJoined?.date}',
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              );
                                            },
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        12.heightBox,
                        const Divider(
                          thickness: 1,
                          color: borderColor,
                          endIndent: 16,
                          indent: 16,
                        ),
                        BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
                          buildWhen: (previous, current) =>
                              previous.selectedEmployee !=
                              current.selectedEmployee,
                          builder: (context, state) {
                            if (state.selectedEmployee.probation == true) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: const BoxDecoration(
                                  color: redColor,
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Under Probation',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                    SecondaryButton(
                                      title: 'Review & Update',
                                      onTap: () {},
                                      fontSize: 14,
                                      titleColor: whiteColor,
                                      backgroundColor: whiteColor,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Under Probation',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: darkColor,
                                        ),
                                      ),
                                    ),
                                    SecondaryButton(
                                      title: 'Review & Update',
                                      onTap: () {},
                                      fontSize: 14,
                                      titleColor: whiteColor,
                                      backgroundColor: whiteColor,
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        8.heightBox,
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            'Attendance Record:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        8.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 123,
                            decoration: const BoxDecoration(
                              color: Color(
                                0xFFD9D9D9,
                              ),
                            ),
                          ),
                        ),
                        8.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: MainButton(
                            title: 'View day by day',
                            onTap: () {},
                          ),
                        ),
                        12.heightBox,
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Salary Details:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        16.heightBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Total Salary',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            8.heightBox,
                            Text(
                              'INR ${(state.selectedEmployee.basicSalary ?? 0) + (state.selectedEmployee.hra ?? 0)}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            8.heightBox,
                            Center(
                              child: Container(
                                width: 26,
                                height: 4,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              ),
                            ),
                            8.heightBox,
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Basic Salary: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'INR ${state.selectedEmployee.basicSalary ?? 0}',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.heightBox,
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'HRA:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' INR ${state.selectedEmployee.hra ?? 0}',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        16.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              backgroundColor: const MaterialStatePropertyAll(
                                greenColor,
                              ),
                              elevation: const MaterialStatePropertyAll(
                                3,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See live location',
                                style: TextStyle(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: BlocBuilder<EmployeeProfileBloc,
                              EmployeeProfileState>(
                            builder: (context, state) {
                              final selectedEmployee = context
                                  .watch<EmployeeDetailsBloc>()
                                  .state
                                  .selectedEmployee;
                              return state.status.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        context.read<EmployeeProfileBloc>().add(
                                              ToggleIsActiveEmployeeProfile(
                                                id: selectedEmployee.uid!,
                                                isActive:
                                                    !selectedEmployee.isActive!,
                                              ),
                                            );
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        padding: const MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(vertical: 16),
                                        ),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          selectedEmployee.isActive == false
                                              ? greenColor
                                              : redColor,
                                        ),
                                        elevation:
                                            const MaterialStatePropertyAll(
                                          3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          selectedEmployee.isActive == true
                                              ? 'Disable Account'
                                              : 'Enable Account',
                                          style: const TextStyle(
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                        12.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 16),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(redColor),
                              elevation: const MaterialStatePropertyAll(3),
                            ),
                            child: const Center(
                              child: Text(
                                'Delete Account',
                                style: TextStyle(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        24.heightBox,
                      ],
                    ),
                  ),
                );
              case EmployeeDetailStatus.failure:
                return const Center(
                  child: Text(
                    'No Employee Profile',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
