import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

import '../../components/custom_textfield.dart';
import '../../resources/auth_methods.dart';
import '../../utils/utils.dart';

class UpdateProfileScreen extends StatefulWidget {
  final Map<String, dynamic> snap;
  const UpdateProfileScreen({super.key, required this.snap});

  static Route<void> route(
    Map<String, dynamic> snap,
  ) {
    return MaterialPageRoute(
      builder: (_) => UpdateProfileScreen(snap: snap),
    );
  }

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  Uint8List? _image;

  final bool _isLoading = false;

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

  String branch = "Branch";

  getAdminData() async {
    var adminDetails = await AuthMethods().getAdminDetails();
    setState(() {
      branch = adminDetails.branch;
    });
  }

  @override
  void initState() {
    setState(() {
      eidController.text = widget.snap['eid'];
      passwordController.text = widget.snap['password'];
      firstNameController.text = widget.snap['firstName'];
      lastNameController.text = widget.snap['lastName'];
      designationController.text = widget.snap['designation'];
      dateJoinedController.text = widget.snap['dateJoined'];
      dobController.text = widget.snap['dob'];
      fathersNameController.text = widget.snap['fathersName'];
      addressController.text = widget.snap['address'];
      emailIDController.text = widget.snap['email'];
      aadharController.text = widget.snap['aadharNumber'];
      panController.text = widget.snap['panNumber'];
      basicSalaryController.text = widget.snap['basicSalary'];
      hraController.text = widget.snap['hra'];
      fieldWorkAllowanceController.text = widget.snap['fieldWorkAllowance'];
    });
    try {
      getAdminData();
    } catch (e) {
      print("Some error: $e");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Update Info",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
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
                        child: CachedNetworkImage(
                          imageUrl: widget.snap['profileUrl'],
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        )),
                    12.heightBox,
                    Row(
                      children: [
                        const Spacer(),
                        SecondaryButton(
                          title: "Change profile picture",
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
              MainButton(
                title: "Save Changes",
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

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
