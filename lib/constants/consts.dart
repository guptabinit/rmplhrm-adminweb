import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required String title,
  required DialogOptionBuilder optionBuilder,
}) {
  final options = optionBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) => Dialog(
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
              'RMPL HRM',
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: options.keys.map(
                (optionTitle) {
                  final value = options[optionTitle];
                  return TextButton(
                    onPressed: () {
                      if (value != null) {
                        Navigator.of(context).pop(value);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(optionTitle),
                  );
                },
              ).toList(),
              // children: [
              // Expanded(
              //   child: MainButton(
              //     title: btn1,
              //     onTap: btn1fun,
              //     fontSize: 14,
              //   ),
              // ),
              // 12.widthBox,
              // Expanded(
              //   child: MainButton(
              //     title: btn2,
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     },
              //     fontSize: 14,
              //   ),
              // ),
              // ],
            ),
          ],
        ),
      ),
    ),
  );
}
