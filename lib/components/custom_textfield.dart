import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.text,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String? text;
  final int? maxLines;
  final TextInputType? inputType;
  final bool isPassword;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? errorText;
  final bool readOnly;
  final Function()? onTap;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      maxLines: maxLines,
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: borderColor),
        ),
        hintText: text,
        filled: true,
        fillColor: lightGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorText: errorText,
      ),
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
