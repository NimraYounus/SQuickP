import 'package:emergencyapp/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/text_file.dart';

class CredintialSreeen extends StatefulWidget {
  const CredintialSreeen({super.key});

  @override
  State<CredintialSreeen> createState() => _CredintialSreeenState();
}

class _CredintialSreeenState extends State<CredintialSreeen> {
  @override
  Widget build(BuildContext context) {
    var usersButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsUnit.theamColor,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/userLogin');
      },
      child: const Text('User Login'),
    );
    var policeButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsUnit.theamColor,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/policeLogin');
      },
      child: const Text('Police Login'),
    );
    var ambulanceButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsUnit.theamColor,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/ambulanceLogin');
      },
      child: const Text('Ambulance Login'),
    );
    var firebigadeButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsUnit.theamColor,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/firebigadeLogin');
      },
      child: const Text('FireBigade Login'),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: ColorsUnit.theamColor,
          elevation: 0,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TextFile.userType,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange),
                ),
                const SizedBox(height: 20),
                usersButton,
                policeButton,
                ambulanceButton,
                firebigadeButton,
              ]),
        ),
      ),
    );
  }
}
