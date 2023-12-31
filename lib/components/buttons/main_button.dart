import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class MainButton extends StatelessWidget {

  const MainButton({
    required this.title, required this.onTap, super.key,
    this.fontSize = 16,
    this.load = false,
    this.mainWidget,
    this.backgroundColor = primaryColor,
  });
  final String title;
  final void Function()? onTap;
  final double? fontSize;
  final bool load;
  final Widget? mainWidget;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: onTap == null ? backgroundColor.withAlpha(155) : backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: load
                ? mainWidget
                : Text(
                    title,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
