import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:validators/validators.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: source, imageQuality: 60);

  if (file != null) {
    return await file.readAsBytes();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

showCustomToast({
  required String message,
  Color bgColor = primaryColor,
  Color txtColor = darkColor,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor,
    textColor: txtColor,
    fontSize: 14.0,
  );
}

extension UtilsX on DateTime? {
  String get date {
    if (this == null) return '';
    if (!isDate(toString())) return '';
    return DateFormat('dd MMM yyyy').format(this!);
  }
}

extension DateTimeExt on String? {
  String? parseDate() {
    if (this == null) return '';
    if (!isDate(toString())) return '';
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(this!));
  }
}

extension LogX on Object? {
  void log() {
    devtools.log(toString());
  }
}
