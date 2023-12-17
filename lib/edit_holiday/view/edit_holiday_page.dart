import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/edit_holiday/edit_holiday.dart';
import 'package:rmpl_hrm_admin/holidays/holidays.dart';

class EditHolidayPage extends StatelessWidget {
  const EditHolidayPage({
    super.key,
    required this.cubit,
    required this.bloc,
  });

  static Route<void> route({
    required EditHolidayCubit cubit,
    required HolidaysBloc bloc,
  }) {
    return MaterialPageRoute(
      builder: (_) => EditHolidayPage(
        cubit: cubit,
        bloc: bloc,
      ),
    );
  }

  final EditHolidayCubit cubit;
  final HolidaysBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cubit,
        ),
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: const EditHolidayForm(),
    );
  }
}
