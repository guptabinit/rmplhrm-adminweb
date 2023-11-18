import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class SecondaryButton extends StatelessWidget {

  const SecondaryButton({
    required this.title, required this.onTap, super.key,
    this.fontSize = 15,
    this.load = false,
    this.mainWidget,
    this.titleColor = primaryColor,
    this.backgroundColor = buttonColor,
  });
  final String title;
  final void Function()? onTap;
  final double? fontSize;
  final bool load;
  final Widget? mainWidget;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}