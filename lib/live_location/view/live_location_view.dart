import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class LiveLocationView extends StatefulWidget {
  const LiveLocationView({super.key});

  @override
  State<LiveLocationView> createState() => LiveLocationViewState();
}

class LiveLocationViewState extends State<LiveLocationView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.4219983, -122.084),
    zoom: 19.151926040649414,
  );

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
        title: const Text(
          'User name location',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        circles: {
          Circle(
            circleId: const CircleId('main_circle'),
            center: const LatLng(37.4219983, -122.084),
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
            position: const LatLng(37.4219983, -122.084),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        },
      ),
    );
  }
}
