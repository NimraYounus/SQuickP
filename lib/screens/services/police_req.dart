import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../widget.dart';

class PoliceRequestScreen extends StatefulWidget {
  const PoliceRequestScreen({super.key});

  @override
  State<PoliceRequestScreen> createState() => _PoliceRequestScreenState();
}

class _PoliceRequestScreenState extends State<PoliceRequestScreen> {
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
          height: height,
          width: width,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width1, vertical: height1),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'In Which Problem you are suffering?',
                      style: problemheading,
                    ),
                  ),
                  serviceButtons('Fight/Fire Emergency'),
                  serviceButtons('Robbery Emergency   '),
                  serviceButtons('Harasment Emergency'),
                ]),
          ),
        ),
      ),
    );
  }
}
