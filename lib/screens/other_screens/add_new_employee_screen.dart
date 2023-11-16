import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/resources/firestore_methods.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/custom_textfield.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  final String branch;
  const AddNewEmployeeScreen({super.key, required this.branch});

  static Route<void> route(String branch) => MaterialPageRoute(
        builder: (_) => AddNewEmployeeScreen(branch: branch),
      );

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  Uint8List? _image;

  bool _isLoading = false;

  TextEditingController eidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController dateJoinedController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController basicSalaryController = TextEditingController();
  TextEditingController hraController = TextEditingController();
  TextEditingController fieldWorkAllowanceController = TextEditingController();

  @override
  void dispose() {
    eidController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    designationController.dispose();
    dateJoinedController.dispose();
    fathersNameController.dispose();
    addressController.dispose();
    emailIDController.dispose();
    aadharController.dispose();
    panController.dispose();
    basicSalaryController.dispose();
    hraController.dispose();
    fieldWorkAllowanceController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  void addNewEmployee() async {
    setState(() {
      _isLoading = true;
    });

    String res = await FirestoreMethods().createNewEmployee(
      eid: eidController.text,
      password: passwordController.text,
      branch: widget.branch,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      dob: dobController.text,
      designation: designationController.text,
      dateJoined: dateJoinedController.text,
      fathersName: fathersNameController.text,
      address: addressController.text,
      email: emailIDController.text,
      aadharNumber: aadharController.text,
      panNumber: panController.text,
      basicSalary: basicSalaryController.text,
      hra: hraController.text,
      fieldWorkAllowance: fieldWorkAllowanceController.text,
      file: _image!,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showCustomToast(message: res);
    } else {
      showCustomToast(message: "Successfully added");
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Add Employee",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       showCustomToast(message: "Add triggered");
        //     },
        //     child: const Text(
        //       "Add",
        //       style: TextStyle(
        //         fontFamily: 'Inter',
        //         fontSize: 14,
        //         fontWeight: FontWeight.w500,
        //         color: whiteColor,
        //       ),
        //     ),
        //   ),
        //   16.widthBox
        // ],
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
              decelerationRate: ScrollDecelerationRate.fast),
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
                          borderRadius: BorderRadius.circular(8)),
                      child: _image != null
                          ? Image.memory(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: IconButton(
                                onPressed: () {
                                  selectImage();
                                },
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ),
                    ),
                    12.heightBox,
                    Row(
                      children: [
                        const Spacer(),
                        SecondaryButton(
                          title: "Add profile picture",
                          onTap: () {
                            selectImage();
                          },
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
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: eidController,
                text: 'Employee ID',
              ),
              12.heightBox,
              const Text(
                'Password',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: passwordController,
                text: 'Create a Password',
              ),
              12.heightBox,
              const Text(
                'First Name',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: firstNameController,
                text: 'First Name',
              ),
              12.heightBox,
              const Text(
                'Last Name',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: lastNameController,
                text: 'Last Name',
              ),
              12.heightBox,
              const Text(
                'Date of Birth',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: dobController,
                text: 'Date of Birth (example: 01.01.2000)',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'Designation',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: designationController,
                text: 'Designation',
              ),
              12.heightBox,
              const Text(
                'Date Joined',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: dateJoinedController,
                text: 'Date Joined (example: 01.01.2000)',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'Father\'s Name',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: fathersNameController,
                text: 'Father\'s Name',
              ),
              12.heightBox,
              const Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: addressController,
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
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: emailIDController,
                inputType: TextInputType.emailAddress,
                text: 'Email ID',
              ),
              12.heightBox,
              const Text(
                'Aadhar Number',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: aadharController,
                text: 'Aadhar Number',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'PAN Number',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: panController,
                text: 'PAN Number',
              ),
              12.heightBox,
              const Text(
                'Basic Salary',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: basicSalaryController,
                text: 'Basic Salary',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'HRA',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: hraController,
                text: 'HRA',
                inputType: TextInputType.number,
              ),
              12.heightBox,
              const Text(
                'Field Work Allowance',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: fieldWorkAllowanceController,
                text: 'Field Work Allowance (Yes/No)',
              ),
              16.heightBox,
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : MainButton(
                      title: "Add employee",
                      onTap: () {
                        if (_image == null) {
                          showCustomToast(message: "Add profile picture");
                        } else {
                          addNewEmployee();
                        }
                      },
                    ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
