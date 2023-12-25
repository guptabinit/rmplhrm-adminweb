import 'dart:async';

import 'package:employee_api/employee_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/live_location/live_location.dart';

class LiveLocationView extends StatefulWidget {
  const LiveLocationView({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  State<LiveLocationView> createState() => _LiveLocationViewState();
}

class _LiveLocationViewState extends State<LiveLocationView> {
  final _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          '${widget.employee.firstName}\'s location',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      //   latitude
      // longitude
      // timestamp

      body: BlocConsumer<LiveLocationBloc, LiveLocationState>(
        listenWhen: (previous, current) =>
            previous.location != current.location ||
            previous.status != current.status,
        listener: (context, state) async {
          if (state.status.isSuccess && state.location != null) {
            final GoogleMapController controller = await _controller.future;
            await controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(
                    state.location!.latitude!,
                    state.location!.longitude!,
                  ),
                  zoom: 19.151926040649414,
                ),
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.location != current.location ||
            previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case LiveLocationStatus.initial:
            case LiveLocationStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LiveLocationStatus.success:
              if (state.location == null) {
                return const Center(
                  child: Text(
                    'No location found',
                  ),
                );
              }

              final googlePlex = CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(
                  state.location!.latitude!,
                  state.location!.longitude!,
                ),
                zoom: 19.151926040649414,
              );

              return GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: googlePlex,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                circles: {
                  Circle(
                    circleId: const CircleId('main_circle'),
                    center: LatLng(
                      state.location!.latitude!,
                      state.location!.longitude!,
                    ),
                    radius: 20,
                    strokeWidth: 2,
                    fillColor: Colors.blue.withOpacity(0.2),
                    strokeColor: Colors.blue.withOpacity(0.4),
                    zIndex: 2,
                    consumeTapEvents: false,
                  ),
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('main_marker'),
                    position: LatLng(
                      state.location!.latitude!,
                      state.location!.longitude!,
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                  ),
                },
              );
            case LiveLocationStatus.failure:
              return const Center(
                child: Text(
                  'Failed to get location',
                ),
              );
          }
        },
      ),
    );
  }
}
