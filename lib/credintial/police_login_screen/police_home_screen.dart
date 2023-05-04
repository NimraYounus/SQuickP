import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../ambulace_login_screen/ambulance_home_screen.dart';

class PoliceHomeScreen extends StatefulWidget {
  const PoliceHomeScreen({super.key});

  @override
  State<PoliceHomeScreen> createState() => _PoliceHomeScreenState();
}

class _PoliceHomeScreenState extends State<PoliceHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('All Police Requests', style: serviceheading),
          elevation: 0,
        ),
        body: listView('User Name', 'Police Request'),
      ),
    );
  }
}
