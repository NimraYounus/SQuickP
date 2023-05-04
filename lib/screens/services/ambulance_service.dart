import 'package:emergencyapp/screens/map/police_google_map.dart';
import 'package:emergencyapp/utils/colors.dart';
import 'package:emergencyapp/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../map/ambulance_google_map.dart';

class AmbulanceService extends StatefulWidget {
  const AmbulanceService({super.key});

  @override
  State<AmbulanceService> createState() => _AmbulanceServiceState();
}

class _AmbulanceServiceState extends State<AmbulanceService> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('Ambulance  Service', style: serviceheading),
          elevation: 0,
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: const AmbulanceGoogleMapScreen(),
        ),
      ),
    );
  }
}
