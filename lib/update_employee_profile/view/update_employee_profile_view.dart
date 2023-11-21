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
              Center(
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
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
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
              ),
              16.heightBox,
              //fields
              const Text(
                'Employee ID',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: eidController,
                text: 'Employee ID',
              ),
              12.heightBox,
              const Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: passwordController,
                text: 'Create a Password',
              ),
              12.heightBox,
              const Text(
                'First Name',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: firstNameController,
                text: 'First Name',
              ),
              12.heightBox,
              const Text(
                'Last Name',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: lastNameController,
                text: 'Last Name',
              ),
              12.heightBox,
              const Text(
                'Date of Birth',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: dobController,
                text: 'Date of Birth (example: 01.01.2000)',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'Designation',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: designationController,
                text: 'Designation',
              ),
              12.heightBox,
              const Text(
                'Date Joined',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: dateJoinedController,
                text: 'Date Joined (example: 01.01.2000)',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                "Father's Name",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: fathersNameController,
                text: "Father's Name",
              ),
              12.heightBox,
              const Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: addressController,
                maxLines: 5,
                text: 'Address',
                inputType: TextInputType.streetAddress,
              ),
              12.heightBox,
              const Text(
                'Email ID',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: emailIDController,
                inputType: TextInputType.emailAddress,
                text: 'Email ID',
              ),
              12.heightBox,
              const Text(
                'Aadhar Number',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: aadharController,
                text: 'Aadhar Number',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'PAN Number',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: panController,
                text: 'PAN Number',
              ),
              12.heightBox,
              const Text(
                'Basic Salary',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: basicSalaryController,
                text: 'Basic Salary',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'HRA',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: hraController,
                text: 'HRA',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'Field Work Allowance',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                // controller: fieldWorkAllowanceController,
                text: 'Field Work Allowance (Yes/No)',
              ),
              16.heightBox,
              MainButton(
                title: 'Save Changes',
                onTap: () {},
              ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

class _EmployeeIdField extends StatelessWidget {
  const _EmployeeIdField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DesignationField extends StatelessWidget {
  const _DesignationField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FathersNameField extends StatelessWidget {
  const _FathersNameField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AddressTextarea extends StatelessWidget {
  const _AddressTextarea();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _EmailIfField extends StatelessWidget {
  const _EmailIfField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AadharNumberField extends StatelessWidget {
  const _AadharNumberField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _PanNumberField extends StatelessWidget {
  const _PanNumberField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _BasicSalaryField extends StatelessWidget {
  const _BasicSalaryField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HRAField extends StatelessWidget {
  const _HRAField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _FieldWorkAllowanceField extends StatelessWidget {
  const _FieldWorkAllowanceField();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
