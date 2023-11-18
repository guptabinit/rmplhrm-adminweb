import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class LeaveApplicationDetailScreen extends StatefulWidget {
  const LeaveApplicationDetailScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const LeaveApplicationDetailScreen(),
    );
  }

  @override
  State<LeaveApplicationDetailScreen> createState() =>
      _LeaveApplicationDetailScreenState();
}

class _LeaveApplicationDetailScreenState
    extends State<LeaveApplicationDetailScreen> {
  final bool _isLoading = false;

  List<String> applicationList = ['Approve', 'Disapprove', 'Pending'];

  String _applicationStatus = 'Pending';

  TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
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
          'Leave Detail',
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
        margin: const EdgeInsets.only(),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              Row(
                children: [
                  Container(
                    height: mq.width * 0.3,
                    width: mq.width * 0.25,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(8),),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress,),),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  16.widthBox,
                  Expanded(
                    child: SizedBox(
                      height: mq.width * 0.3,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            'Durgesh Jadhav',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,),
                          ),
                          Spacer(),
                          Text(
                            'Sr. App Developer',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,),
                          ),
                          Spacer(),
                          Text(
                            'EID: NDCO2323',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Divider(
                thickness: 1,
                color: borderColor,
              ),
              12.heightBox,
              const Text(
                'Leave Details:',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              16.heightBox,
              const Row(
                children: [
                  Text(
                    'Leave type: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Casual Leave',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Row(
                children: [
                  Text(
                    'Applied on: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '12/09/2023',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Row(
                children: [
                  Text(
                    'Single/Multiple Days: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Multiple Days',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Row(
                children: [
                  Text(
                    'From date: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '18/09/2023',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Row(
                children: [
                  Text(
                    'To date: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '19/09/2023',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reason: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Some reason. IGNORE all of this. This is just to make it look big so I can see if there is any issue with indentation.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              12.heightBox,
              const Divider(
                thickness: 1,
                color: borderColor,
              ),
              12.heightBox,
              RadioListTile(
                title: const Text('Approve'),
                value: applicationList[0],
                groupValue: _applicationStatus,
                onChanged: (value) {
                  setState(() {
                    _applicationStatus = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Disapprove'),
                value: applicationList[1],
                groupValue: _applicationStatus,
                onChanged: (value) {
                  setState(() {
                    _applicationStatus = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Pending'),
                value: applicationList[2],
                groupValue: _applicationStatus,
                onChanged: (value) {
                  setState(() {
                    _applicationStatus = value!;
                  });
                },
              ),
              16.heightBox,
              Row(
                children: [
                  const Text(
                    'Application Status: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _applicationStatus,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              16.heightBox,
              //fields
              const Text(
                "Admin's Reason (if any)",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: reasonController,
                text: 'Enter a reason (if any)',
                maxLines: 5,
              ),
              16.heightBox,
              if (_isLoading) const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ) else MainButton(
                      title: 'Update Leave Response',
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
