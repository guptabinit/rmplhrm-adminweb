import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_api_client/holiday_api_client.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/edit_holiday/edit_holiday.dart';
import 'package:rmpl_hrm_admin/holidays/holidays.dart';

class HolidaysPage extends StatelessWidget {
  const HolidaysPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const HolidaysPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HolidaysBloc(
            holidayRepository: HolidayRepository(
              api: HolidayApiClient(
                firestore: FirebaseFirestore.instance,
              ),
            ),
          )..add(
              HolidaysDateChanged(
                DateTime.now().add(
                  const Duration(seconds: 1),
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => EditHolidayCubit(
            holidayRepository: context.read<HolidayRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HolidaysBloc, HolidaysState>(
            listenWhen: (previous, current) => previous.date != current.date,
            listener: (context, state) {
              if (!state.status.isLoading) {
                context.read<HolidaysBloc>().add(
                      HolidaysFetched(
                        context.read<AppBloc>().state.user.id,
                      ),
                    );
              }
            },
          ),
          BlocListener<HolidaysBloc, HolidaysState>(
            listenWhen: (previous, current) =>
                previous.deleteStatus != current.deleteStatus,
            listener: (context, state) {
              if (state.deleteStatus.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Holiday deleted'),
                    ),
                  );
              }
              if (state.deleteStatus.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      content: Text(
                        state.deleteError ?? 'Error deleting holiday',
                      ),
                    ),
                  );
              }
            },
          ),
          BlocListener<HolidaysBloc, HolidaysState>(
            listenWhen: (previous, current) =>
                previous.selectedHoliday != current.selectedHoliday,
            listener: (context, state) {
              if (state.selectedHoliday == null ||
                  state.selectedHoliday?.isEmpty == true) return;
              context.read<EditHolidayCubit>()
                ..dateChanged('${state.selectedHoliday?.date ?? ''}')
                ..titleChanged(state.selectedHoliday?.title ?? '');
              Navigator.of(context).push(
                EditHolidayPage.route(
                  cubit: context.read<EditHolidayCubit>(),
                  bloc: context.read<HolidaysBloc>(),
                ),
              );
            },
          ),
        ],
        child: const HolidaysView(),
      ),
    );
  }
}
