import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class UpdateEmployeeProfileView extends StatelessWidget {
  const UpdateEmployeeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
        const CustomTextFormField(
          text: 'Employee ID',
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
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
        const CustomTextFormField(
          text: 'Create a Password',
        ),
      ],
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
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
        const CustomTextFormField(
          text: 'First Name',
        ),
      ],
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
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
        const CustomTextFormField(
          text: 'Last Name',
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
        const CustomTextFormField(
          text: 'Date of Birth (example: 01.01.2000)',
          inputType: TextInputType.number,
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
        const CustomTextFormField(
          text: 'Designation',
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
        const CustomTextFormField(
          text: 'Date Joined (example: 01.01.2000)',
          inputType: TextInputType.number,
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
        const CustomTextFormField(
          text: "Father's Name",
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
        const CustomTextFormField(
          maxLines: 5,
          text: 'Address',
          inputType: TextInputType.streetAddress,
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
        const CustomTextFormField(
          inputType: TextInputType.emailAddress,
          text: 'Email ID',
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
        const CustomTextFormField(
          text: 'Aadhar Number',
          inputType: TextInputType.number,
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
        const CustomTextFormField(
          text: 'PAN Number',
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
        const CustomTextFormField(
          text: 'Basic Salary',
          inputType: TextInputType.number,
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
        const CustomTextFormField(
          text: 'HRA',
          inputType: TextInputType.number,
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
        const CustomTextFormField(
          text: 'Field Work Allowance (Yes/No)',
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return MainButton(
      title: 'Save Changes',
      onTap: () {},
    );
  }
}
