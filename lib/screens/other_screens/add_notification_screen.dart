import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/resources/auth_methods.dart';
import 'package:rmpl_hrm_admin/resources/firestore_methods.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class NewNotificationScreen extends StatefulWidget {
  const NewNotificationScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const NewNotificationScreen(),
      );

  @override
  State<NewNotificationScreen> createState() => _NewNotificationScreenState();
}

class _NewNotificationScreenState extends State<NewNotificationScreen> {
  bool _isLoading = false;

  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  String branch = 'Branch';

  getAdminData() async {
    final adminDetails = await AuthMethods().getAdminDetails();
    setState(() {
      branch = adminDetails.branch;
    });
  }

  @override
  void initState() {
    try {
      getAdminData();
    } catch (e) {
      'Some error: $e'.log();
    }
    super.initState();
  }

  Future<void> addNewNotification() async {
    setState(() {
      _isLoading = true;
    });

    final res = await FirestoreMethods().createNewNotification(
      branch: branch,
      type: selectedNotificationTypeValue!,
      receiver: selectedReceiverValue!,
      message: messageController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      await showCustomToast(message: res);
    } else {
      await showCustomToast(message: 'Successfully added');
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  // Dropdown Menu --> Notification Type
  List<DropdownMenuItem<String>> get dropdownReceiverItems {
    final menuItems = <DropdownMenuItem<String>>[
      const DropdownMenuItem(value: 'All', child: Text('All')),
    ];
    return menuItems;
  }

  // Dropdown Menu --> Receiver
  List<DropdownMenuItem<String>> get dropdownNotificationTypeItems {
    final menuItems = <DropdownMenuItem<String>>[
      const DropdownMenuItem(value: 'Common', child: Text('Common')),
      const DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
    ];
    return menuItems;
  }

  String? selectedNotificationTypeValue = 'Common';

  String? selectedReceiverValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'New Notification',
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
            decelerationRate: ScrollDecelerationRate.fast,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              //fields
              const Text(
                'Receiver',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: selectedReceiverValue,
                        hint: const Text('Select the receiver'),
                        items: dropdownReceiverItems,
                        onChanged: (String? value) {
                          setState(() {
                            selectedReceiverValue = value;
                          });
                        },
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              12.heightBox,
              const Text(
                'Notification type',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: selectedNotificationTypeValue,
                        hint: const Text('Select the notification type'),
                        items: dropdownNotificationTypeItems,
                        onChanged: (String? value) {
                          setState(() {
                            selectedNotificationTypeValue = value;
                          });
                        },
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              12.heightBox,
              const Text(
                'Notification Message',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              CustomTextFormField(
                controller: messageController,
                text: 'Notification Message',
                maxLines: 8,
              ),
              16.heightBox,
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              else
                MainButton(
                  title: 'Add Notification',
                  onTap: addNewNotification,
                ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
