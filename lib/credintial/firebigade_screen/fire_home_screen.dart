import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../ambulace_login_screen/ambulance_home_screen.dart';

class FirebigadeHomeScreen extends StatefulWidget {
  const FirebigadeHomeScreen({super.key});

  @override
  State<FirebigadeHomeScreen> createState() => _FirebigadeHomeScreenState();
}

class _FirebigadeHomeScreenState extends State<FirebigadeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('All FireBigade Requests', style: serviceheading),
          elevation: 0,
        ),
        body: listView('User Name', 'FireBigade Request'),
      ),
    );
  }
}
