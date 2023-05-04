import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../map/firebigade_google_map.dart';
import '../widget.dart';

class FireBigadeService extends StatefulWidget {
  const FireBigadeService({super.key});

  @override
  State<FireBigadeService> createState() => _FireBigadeServiceState();
}

class _FireBigadeServiceState extends State<FireBigadeService> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('FireBigade Service', style: serviceheading),
          elevation: 0,
        ),
        body: const FirebigadeGoogleMapScreen(),
      ),
    );
  }
}
