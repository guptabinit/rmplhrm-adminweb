import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';
import 'package:rmpl_hrm_admin/main.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.onPress,
    required this.child,
    super.key,
    this.backgroundColor = primaryColor,
  });
  final void Function()? onPress;
  final Widget child;
  final Color backgroundColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        padding: mq.width > webScreenSize
            ? const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20))
            : const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16),
              ),
        backgroundColor: const MaterialStatePropertyAll(primaryColor),
        elevation: const MaterialStatePropertyAll(3),
      ),
      child: Center(
        child: widget.child,
      ),
    );
  }
}

Widget customButton(
  void Function()? onPress,
  String text,
  BuildContext context,
) {
  mq = MediaQuery.of(context).size;
  return ElevatedButton(
    onPressed: onPress,
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      padding: mq.width > webScreenSize
          ? const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20))
          : const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
      backgroundColor: const MaterialStatePropertyAll(buttonColor),
      elevation: const MaterialStatePropertyAll(3),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
  );
}
