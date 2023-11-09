import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/custom_textfield.dart';
import '../../resources/auth_methods.dart';
import '../../resources/firestore_methods.dart';

class NewNotificationScreen extends StatefulWidget {
  const NewNotificationScreen({super.key});

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

  String branch = "Branch";

  getAdminData() async {
    var adminDetails = await AuthMethods().getAdminDetails();
    setState(() {
      branch = adminDetails.branch;
    });
  }

  @override
  void initState() {
    try {
      getAdminData();
    } catch (e) {
      print("Some error: $e");
    }
    super.initState();
  }

  void addNewNotification() async {
    setState(() {
      _isLoading = true;
    });

    String res = await FirestoreMethods().createNewNotification(
      branch: branch,
      type: selectedNotificationTypeValue!,
      receiver: selectedReceiverValue!,
      message: messageController.text,
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

  // Dropdown Menu --> Notification Type
  List<DropdownMenuItem<String>> get dropdownReceiverItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "All", child: Text("All")),
    ];
    return menuItems;
  }

  // Dropdown Menu --> Receiver
  List<DropdownMenuItem<String>> get dropdownNotificationTypeItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Common", child: Text("Common")),
      const DropdownMenuItem(value: "Urgent", child: Text("Urgent")),
    ];
    return menuItems;
  }

  String? selectedNotificationTypeValue = "Common";

  String? selectedReceiverValue = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "New Notification",
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
                'Receiver',
                style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: selectedReceiverValue,
                        hint: const Text("Select the receiver"),
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
                style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: selectedNotificationTypeValue,
                        hint: const Text("Select the notification type"),
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
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : MainButton(
                      title: "Add Notification",
                      onTap: () => addNewNotification(),
                    ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
