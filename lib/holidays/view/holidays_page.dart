import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/holidays/holidays.dart';

class HolidaysPage extends StatelessWidget {
  const HolidaysPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const HolidaysPage());

  @override
  Widget build(BuildContext context) {
    return const HolidaysView();
  }
}
