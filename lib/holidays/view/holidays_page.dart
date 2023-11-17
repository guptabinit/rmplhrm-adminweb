import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:rmpl_hrm_admin/holidays/holidays.dart';
import 'package:holiday_api_client/holiday_api_client.dart';

class HolidaysPage extends StatelessWidget {
  const HolidaysPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const HolidaysPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HolidaysBloc(
        holidayRepository: HolidayRepository(
          api: HolidayApiClient(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      )..add(HolidaysDateChanged(DateTime.now())),
      child: BlocListener<HolidaysBloc, HolidaysState>(
        listenWhen: (previous, current) => previous.date != current.date,
        listener: (context, state) {
          if (!state.status.isLoading) {
            context.read<HolidaysBloc>().add(HolidaysFetched());
          }
        },
        child: const HolidaysView(),
      ),
    );
  }
}
