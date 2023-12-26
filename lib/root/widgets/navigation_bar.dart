import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    required this.route,
    required this.selected,
    super.key,
  });

  final AppRoute route;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selected ? primaryColor.withOpacity(0.3) : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          context.read<RootCubit>().navigateTo(route);
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Icon(route.icon),
              12.widthBox,
              Expanded(
                child: Text(
                  route.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
