import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../map/police_google_map.dart';
import '../widget.dart';

class PoliceService extends StatefulWidget {
  const PoliceService({super.key});

  @override
  State<PoliceService> createState() => _PoliceServiceState();
}

class _PoliceServiceState extends State<PoliceService> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width / 11;
    var height1 = MediaQuery.of(context).size.height / 20;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('Police  Service', style: serviceheading),
          elevation: 0,
        ),
        body: SizedBox(
            height: height, width: width, child: const PoliceGoogleMapScreen()),
      ),
    );
  }
}
