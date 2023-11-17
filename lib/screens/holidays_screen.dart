import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/models/holiday_model.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

import '../components/buttons/secondary_button.dart';

@Deprecated('Use HolidayPage instead of this class')
class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const HolidayScreen(),
      );

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  DateTime selectedDate = DateTime.now();
  final formatterDate = DateFormat('MMM yyyy');

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
                        // color: primaryColor,
                        colorFilter: const ColorFilter.mode(
                          primaryColor,
                          BlendMode.srcIn,
                        ),
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
                        onTap: () async {
                          final date = await showMonthPicker(
                            context: context,
                            initialDate: selectedDate,
                          );
                          if (date != null) setState(() => selectedDate = date);
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.heightBox,
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('holidays')
                        .where(
                          'date',
                          isGreaterThanOrEqualTo: DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            1,
                          ),
                          isLessThanOrEqualTo: DateTime(
                            selectedDate.year,
                            selectedDate.month + 1,
                            0,
                          ),
                        )
                        .snapshots(),
                    builder: (
                      context,
                      snapshot,
                    ) {
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
                            physics: const BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                final holiday = HolidayModel.fromJson(
                                  snapshot.data!.docs[index].data(),
                                );

                                return Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  // child: HolidayCardWidget(
                                  //   holiday: holiday,
                                  // ),
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
