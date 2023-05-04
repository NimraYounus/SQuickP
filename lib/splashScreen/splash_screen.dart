import 'dart:async';

import 'package:emergencyapp/slider/slider.dart';
import 'package:emergencyapp/utils/colors.dart';
import 'package:emergencyapp/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/text_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final width2 = MediaQuery.of(context).size.width / 5;
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsUnit.theamColor,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextFile.appName,
                  style: GoogleFonts.akayaKanadaka(
                    textStyle: h1,
                  ),
                ),
                Text(
                  TextFile.fullName,
                  style: GoogleFonts.actor(
                    textStyle: h2,
                  ),
                ),
                SizedBox(
                  height: width2 / 2,
                ),
                const CircularProgressIndicator(
                  color: Colors.orange,
                )
              ],
            ),
          )),
    );
  }
}
