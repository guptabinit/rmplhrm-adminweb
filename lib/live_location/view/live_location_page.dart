import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/live_location/live_location.dart';

class LiveLocationPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LiveLocationPage(),
      );

  const LiveLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LiveLocationView();
  }
}
