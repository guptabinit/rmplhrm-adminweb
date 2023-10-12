import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:rmpl_hrm_admin/components/custom_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fieldcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   centerTitle: false,
      //   title: Text(
      //     'My Profile',
      //     style: TextStyle(
      //         fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w600),
      //   ),
      //   elevation: 0,
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: mq.width * 0.3,
                    width: mq.width * 0.25,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/indian-businessman-with-his-white-car_496169-2889.jpg?w=826&t=st=1696602424~exp=1696603024~hmac=72acb026a4b523a21fca8bbc7bca55f477bafd7d00f1b94ff4353b42a7e88104',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  20.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rajesh Kundra',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      12.heightBox,
                      const Text(
                        'Designation',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      12.heightBox,
                      const Text(
                        'Employee since 12 August 2020',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      12.heightBox
                    ],
                  )
                ],
              ),
              SizedBox(
                height: mq.width * 0.1,
              ),
              const Text(
                'Field 1',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              12.heightBox,
              customTextFormField('Field 1', fieldcontroller),
              16.heightBox,
              const Text(
                'Field 2',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              12.heightBox,
              customTextFormField('Field 1', fieldcontroller),
              16.heightBox,
              const Text(
                'Field 3',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              12.heightBox,
              customTextFormField('Field 1', fieldcontroller),
              const Spacer(),
              customButton(() {}, 'Save Changes', context)
            ],
          ),
        ),
      ),
    );
  }
}
