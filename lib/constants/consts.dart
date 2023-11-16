import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/buttons/main_button.dart';

showCustomDialog({
  required context,
  required String title,
  required String btn1,
  required void Function()? btn1fun,
  required String btn2,
}) {
  showDialog(
    context: context,
    builder: (ctx) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "RMPL HRM",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            12.heightBox,
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            16.heightBox,
            Row(
              children: [
                Expanded(
                  child: MainButton(
                    title: btn1,
                    onTap: btn1fun,
                    fontSize: 14,
                  ),
                ),
                12.widthBox,
                Expanded(
                  child: MainButton(
                    title: btn2,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
