import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:rmpl_hrm_admin/add_holiday/add_holiday.dart';

class AddHolidayPage extends StatelessWidget {
  const AddHolidayPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddHolidayPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddHolidayCubit(
        holidayRepository: context.read<HolidayRepository>(),
      ),
      child: const AddHolidayForm(),
    );
  }
}
