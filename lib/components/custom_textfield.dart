import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final int maxLines;
  final TextInputType inputType;
  final bool isPassword;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.text,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: borderColor),
        ),
        hintText: widget.text,
        filled: true,
        fillColor: lightGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}