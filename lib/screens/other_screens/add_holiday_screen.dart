import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/resources/firestore_methods.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/custom_textfield.dart';
import 'package:intl/intl.dart';

class AddHolidayScreen extends StatefulWidget {
  const AddHolidayScreen({super.key});

  @override
  State<AddHolidayScreen> createState() => _AddHolidayScreenState();
}

class _AddHolidayScreenState extends State<AddHolidayScreen> {
  bool _isLoading = false;

  TextEditingController holidayTitle = TextEditingController();

  TextEditingController dateSelected = TextEditingController();

  DateTime date = DateTime.now();
  var formatterDate = DateFormat('dd/MM/yyyy');
  var formatterMonth = DateFormat('MM/yyyy');

  @override
  void dispose() {
    holidayTitle.dispose();
    super.dispose();
  }

  void addNewHoliday() async {
    setState(() {
      _isLoading = true;
    });

    // String res = "test";

    String res = await FirestoreMethods().addHoliday(
      date: dateSelected.text,
      title: holidayTitle.text,
      formattedDate: formatterMonth.format(date),
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showCustomToast(message: res);
    } else {
      showCustomToast(message: "Successfully added");
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      dateSelected.text = formatterDate.format(date);
    });

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Add Holiday",
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
          physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              //fields
              const Text(
                'Select the date',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: dateSelected,
                text: 'Date',
                suffixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    ).then((dt) {
                      if (dt != null) {
                        setState(() {
                          date = dt;
                        });
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_today,
                    color: primaryColor,
                  ),
                ),
              ),
              12.heightBox,
              const Text(
                'Holiday title',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: holidayTitle,
                text: 'Enter a title for the holiday',
              ),
              16.heightBox,
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : MainButton(
                      title: "Add Holiday",
                      onTap: () => addNewHoliday(),
                    ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
