import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      color: primaryColor,
      padding: EdgeInsets.only(left: 16, top: mq.width * 0.15, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/images/LOGO.png',
            width: mq.width * 0.3,
          ),
          12.widthBox,
          const Text(
            'Recorded\nMusic\nPrivate\nLimited',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20, color: whiteColor),
          )
        ],
      ),
    );
  }
}
