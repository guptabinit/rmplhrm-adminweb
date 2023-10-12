import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget notificationCard() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    margin: EdgeInsets.only(left: 12, right: 12, top: 16),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor, width: 1.5),
      boxShadow: [
        BoxShadow(
          color: borderColor,
          spreadRadius: 0.2,
          blurRadius: 4,
          // blurStyle: BlurStyle.outer,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          'Everyone are requested to do this. adj wn wedpw wosc wkn wn eneiov k en nsvc ni. In',
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w400),
        ),
        8.heightBox,
        Row(
          children: [
            Expanded(
              child: Text(
                '24.10.2023 11:00AM IST',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: textGreyColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_square,
                  color: primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: primaryColor,
                ))
          ],
        )
      ],
    ),
  );
}
