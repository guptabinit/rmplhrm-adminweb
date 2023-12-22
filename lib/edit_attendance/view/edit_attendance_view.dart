import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/custom_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EditAttendanceView extends StatelessWidget {
  const EditAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Edit attendance',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Employee name: ',
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                    children: const [
                      TextSpan(
                        text: 'John Doe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Punched in: ',
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                    children: const [
                      TextSpan(
                        text: '08:00 AM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Punched out: ',
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                    children: const [
                      TextSpan(
                        text: '05:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                Text(
                  'Punch in',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                4.heightBox,
                CustomTextFormField(
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                  text: 'Punched in',
                  readOnly: true,
                  suffixIcon: const Icon(Icons.punch_clock),
                ),
                12.heightBox,
                Text(
                  'Punch out',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                4.heightBox,
                CustomTextFormField(
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                  text: 'Punched out',
                  readOnly: true,
                  suffixIcon: const Icon(Icons.lock_clock),
                ),
                25.heightBox,
                CustomButton(
                  onPress: () {},
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
