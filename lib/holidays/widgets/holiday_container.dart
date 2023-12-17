import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/dialogs/dialogs.dart';
import 'package:rmpl_hrm_admin/holidays/bloc/holidays_bloc.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class HolidayCardWidget extends StatelessWidget {
  const HolidayCardWidget({
    required this.holiday,
    super.key,
  });

  final Holiday holiday;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      child: ListTile(
        title: Text(
          '${holiday.date?.date}',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${holiday.title}',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: textGreyColor,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                context.read<HolidaysBloc>().add(
                      SelectedHoliday(holiday: holiday),
                    );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () async {
                final result = await const DeleteDialog(
                  titleOfObjectToDelete: 'holiday',
                ).present(context);
                if (result == true && context.mounted) {
                  context.read<HolidaysBloc>().add(
                        DeleteHoliday(
                          id: holiday.id!,
                          creator: context.read<AppBloc>().state.user.id,
                        ),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
