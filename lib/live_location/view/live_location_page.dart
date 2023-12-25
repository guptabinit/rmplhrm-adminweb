import 'package:employee_api/employee_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_location_repository/live_location_repository.dart';
import 'package:rmpl_hrm_admin/live_location/live_location.dart';

class LiveLocationPage extends StatelessWidget {
  static Route<void> route(Employee employee) => MaterialPageRoute(
        builder: (_) => LiveLocationPage(
          employee: employee,
        ),
      );

  const LiveLocationPage({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LiveLocationBloc(
        repository: context.read<LiveLocationRepository>(),
      )..add(
          LiveLocationLoaded(employee),
        ),
      child: LiveLocationView(
        employee: employee,
      ),
    );
  }
}
