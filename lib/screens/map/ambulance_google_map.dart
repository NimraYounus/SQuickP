import 'dart:async';
import 'package:emergencyapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmbulanceGoogleMapScreen extends StatefulWidget {
  const AmbulanceGoogleMapScreen({Key? key}) : super(key: key);

  @override
  _AmbulanceGoogleMapScreenState createState() =>
      _AmbulanceGoogleMapScreenState();
}

class _AmbulanceGoogleMapScreenState extends State<AmbulanceGoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(24.8316833, 67.1346417),
    zoom: 14.4746,
  );
  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.851733964872857, 67.11748616189062),
        infoWindow: InfoWindow(
          title: 'Nearest Ambulance Station',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        foregroundColor: ColorsUnit.theamColor,
        onPressed: () {
          Navigator.pushNamed(context, '/ambulanceReq');
        },
        label: const Text("Request"),
        icon: const Icon(Icons.location_history),
      ),
      body: SafeArea(
        child: GoogleMap(
          // camera position
          initialCameraPosition: _kGoogle,
          // markers on the map
          markers: Set<Marker>.of(_markers),
          // map type.
          mapType: MapType.normal,
          // user location enabled.
          myLocationEnabled: true,
          // compass enabled.
          compassEnabled: true,
          // on below line specifying controller on map complete.
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
