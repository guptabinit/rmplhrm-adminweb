import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm_admin/components/holiday_container.dart';
import 'package:rmpl_hrm_admin/components/side_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';
import '../components/buttons/secondary_button.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  DateTime selectedDate = DateTime.now();
  var formatterDate = DateFormat('MMM yyyy');
  var monthFormatter = DateFormat('MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Calendar.svg',
                        color: primaryColor,
                      ),
                      8.widthBox,
                      Text(
                        formatterDate.format(selectedDate),
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      12.widthBox,
                      SecondaryButton(
                        title: "Change Duration",
                        onTap: () {
                          showMonthPicker(
                            context: context,
                            initialDate: selectedDate,
                          ).then((date) {
                            if (date != null) {
                              setState(() {
                                selectedDate = date;
                              });
                            }
                          });
                        },
                        fontSize: 14,
                      ),
                    ],
                  ),
                  16.heightBox,
                  const Text(
                    'Holidays other then Sat/Sun',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        // color: primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  8.heightBox,
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('holidays').where('formattedDate', isEqualTo: monthFormatter.format(selectedDate)).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data!.docs.length} holidays this month',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: textGreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Divider(
                            color: textGreyColor,
                          ),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> snap = snapshot.data!.docs[index].data();

                                return Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  child: HolidayCardWidget(snap: snap),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
