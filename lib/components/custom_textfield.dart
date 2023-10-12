import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

Widget customTextFormField(String text,TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor)),
        hintText: text,
        filled: true,
        fillColor: lightGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  );
}
