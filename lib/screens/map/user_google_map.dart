import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 75.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          title: const Text('Current Location', style: h2),
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
        // on pressing floating action button the camera will take to user current location
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              print(
                  value.latitude.toString() + " " + value.longitude.toString());

              // marker added for current users location
              _markers.add(Marker(
                markerId: const MarkerId("1"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(
                  title: 'My Current Location',
                ),
              ));

              // specified current users location
              CameraPosition cameraPosition = CameraPosition(
                target: LatLng(value.latitude, value.longitude),
                zoom: 14,
              );

              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {});
            });
          },
          child: const Icon(
            Icons.local_activity,
            color: ColorsUnit.theamColor,
          ),
        ),
      ),
    );
  }
}
