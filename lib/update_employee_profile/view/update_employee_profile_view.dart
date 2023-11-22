import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class UpdateEmployeeProfileView extends StatelessWidget {
  const UpdateEmployeeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Update Info',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              const _ChangeProfilePicture(),
              16.heightBox,
              const _EmployeeIdField(),
              12.heightBox,
              const _PasswordField(),
              12.heightBox,
              const _FirstNameField(),
              12.heightBox,
              const _LastNameField(),
              12.heightBox,
              const _DateOfBirthField(),
              12.heightBox,
              const _DesignationField(),
              12.heightBox,
              const _DateJoinedField(),
              12.heightBox,
              const _FathersNameField(),
              12.heightBox,
              const _AddressTextarea(),
              12.heightBox,
              const _EmailField(),
              12.heightBox,
              const _AadharNumberField(),
              12.heightBox,
              const _PanNumberField(),
              12.heightBox,
              const _BasicSalaryField(),
              12.heightBox,
              const _HRAField(),
              12.heightBox,
              const _FieldWorkAllowanceField(),
              16.heightBox,
              const _SaveButton(),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangeProfilePicture extends StatelessWidget {
  const _ChangeProfilePicture();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: mq.width * 0.4,
            width: mq.width * 0.3,
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: 'widget.snap[profileUrl]', // TODO: real url
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
          12.heightBox,
          Row(
            children: [
              const Spacer(),
              SecondaryButton(
                title: 'Change profile picture',
                onTap: () {},
                fontSize: 14,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmployeeIdField extends StatelessWidget {
  const _EmployeeIdField();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Employee ID',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.employeeId != current.employeeId,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Employee ID',
              controller: controller,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .employeeIdChanged(value);
              },
              errorText: state.employeeId.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.password != current.password,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Create a Password',
              controller: controller,
              errorText: state.password.displayError?.text,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .passwordChanged(value);
              },
            );
          },
        ),
      ],
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'First Name',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.firstName != current.firstName,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'First Name',
              controller: controller,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .firstNameChanged(value);
              },
              errorText: state.firstName.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Last Name',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.lastName != current.lastName,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Last Name',
              controller: controller,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .lastNameChanged(value);
              },
              errorText: state.lastName.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Date of Birth',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.dateOfBirth != current.dateOfBirth,
          builder: (context, state) {
            final controller = TextEditingController(
              text: state.dateOfBirth.value.toString().parseDate(),
            );
            return CustomTextFormField(
              text: 'Date of Birth',
              inputType: TextInputType.number,
              controller: controller,
              suffixIcon: const Icon(
                Icons.calendar_month,
              ),
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1970),
                  lastDate: DateTime(DateTime
                      .now()
                      .year - 12),
                );
                if (date != null && context.mounted) {
                  context
                      .read<UpdateEmployeeProfileCubit>()
                      .dateOfBirthChanged(date.toString());
                }
              },
              errorText: state.dateOfBirth.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _DesignationField extends StatelessWidget {
  const _DesignationField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Designation',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.designation != current.designation,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Designation',
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .designationChanged(value);
              },
              errorText: state.designation.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _DateJoinedField extends StatelessWidget {
  const _DateJoinedField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Date Joined',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.dateJoined != current.dateJoined,
          builder: (context, state) {
            final controller = TextEditingController(
              text: state.dateJoined.value.toString().parseDate(),
            );
            return CustomTextFormField(
              text: 'Date Joined (example: 01.01.2000)',
              suffixIcon: const Icon(Icons.calendar_month),
              controller: controller,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1970),
                  lastDate: DateTime(DateTime
                      .now()
                      .year),
                );
                if (date != null && context.mounted) {
                  context
                      .read<UpdateEmployeeProfileCubit>()
                      .dateJoinedChanged(date.toString());
                }
              },
              readOnly: true,
              errorText: state.dateJoined.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _FathersNameField extends StatelessWidget {
  const _FathersNameField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Father's Name",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.fathersName != current.fathersName,
          builder: (context, state) {
            return CustomTextFormField(
              text: "Father's Name",
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .fathersNameChanged(value);
              },
              errorText: state.fathersName.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _AddressTextarea extends StatelessWidget {
  const _AddressTextarea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Address',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) => previous.address != current.address,
          builder: (context, state) {
            return CustomTextFormField(
              maxLines: 5,
              text: 'Address',
              inputType: TextInputType.streetAddress,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .addressChanged(value);
              },
              errorText: state.address.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Email ID',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return CustomTextFormField(
              inputType: TextInputType.emailAddress,
              text: 'Email ID',
              onChanged: (String? value) {
                context.read<UpdateEmployeeProfileCubit>().emailChanged(value);
              },
              errorText: state.email.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _AadharNumberField extends StatelessWidget {
  const _AadharNumberField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Aadhar Number',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.aadharCard != current.aadharCard,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Aadhar Number',
              inputType: TextInputType.number,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .aadharCardChanged(value);
              },
              errorText: state.aadharCard.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _PanNumberField extends StatelessWidget {
  const _PanNumberField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'PAN Number',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) => previous.panCard != current.panCard,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'PAN Number',
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .panCardChanged(value);
              },
              errorText: state.panCard.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _BasicSalaryField extends StatelessWidget {
  const _BasicSalaryField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Basic Salary',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.basicSalary != current.basicSalary,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Basic Salary',
              inputType: TextInputType.number,
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .basicSalaryChanged(value);
              },
              errorText: state.basicSalary.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _HRAField extends StatelessWidget {
  const _HRAField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'HRA',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) => previous.hra != current.hra,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'HRA',
              inputType: TextInputType.number,
              onChanged: (String? value) {
                context.read<UpdateEmployeeProfileCubit>().hraChanged(value);
              },
              errorText: state.hra.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _FieldWorkAllowanceField extends StatelessWidget {
  const _FieldWorkAllowanceField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Field Work Allowance',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
          buildWhen: (previous, current) =>
          previous.fieldWorkAllowance != current.fieldWorkAllowance,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'Field Work Allowance (Yes/No)',
              onChanged: (String? value) {
                context
                    .read<UpdateEmployeeProfileCubit>()
                    .fieldWorkAllowanceChanged(value);
              },
              errorText: state.fieldWorkAllowance.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateEmployeeProfileCubit, UpdateEmployeeProfileState>(
      builder: (context, state) {
        return MainButton(
          title: 'Save Changes',
          onTap: !state.isValid ? null : () {},
        );
      },
    );
  }
}
