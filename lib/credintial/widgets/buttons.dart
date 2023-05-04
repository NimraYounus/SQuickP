import 'package:emergencyapp/utils/colors.dart';
import 'package:flutter/material.dart';

Widget usersButton(logintype, navigation) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorsUnit.theamColor,
      elevation: 0,
    ),
    onPressed: () {
      //Navigator.pushNamed(context, navigation);
    },
    child: Text(logintype),
  );
}
