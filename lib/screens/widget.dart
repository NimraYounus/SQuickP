import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';
import '../utils/colors.dart';

Widget serviceButtons(servicename) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.grey,
          backgroundColor: Colors.green),
      onPressed: () {},
      child: Text(servicename));
}

Widget policButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: ColorsUnit.theamColor),
    onPressed: () {},
    child: Row(
      children: const [
        Icon(
          HumanitarianIcons.police_station,
          size: 20.0,
        ),
        Text(
          " Need Police help?",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}

Widget ambulanceButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: ColorsUnit.theamColor),
    onPressed: () {},
    child: Row(
      children: const [
        Icon(
          HumanitarianIcons.ambulance,
          size: 20.0,
        ),
        Text(
          " Need Ambulance?",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}

Widget forebigafeButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.grey,
        backgroundColor: ColorsUnit.theamColor),
    onPressed: () {},
    child: Row(
      children: const [
        Icon(
          HumanitarianIcons.fire,
          size: 20.0,
        ),
        Text(
          " Need Fire Bigade?",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}
