import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class AmbulanceHomeScreen extends StatefulWidget {
  const AmbulanceHomeScreen({super.key});

  @override
  State<AmbulanceHomeScreen> createState() => _AmbulanceHomeScreenState();
}

class _AmbulanceHomeScreenState extends State<AmbulanceHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white,
          title: const Text('All Ambulance Requests', style: serviceheading),
          elevation: 0,
        ),
        body: listView('User Name', 'Ambulance Request'),
      ),
    );
  }
}

Widget listView(String name, String reqType) {
  return ListView.builder(
    itemCount: 50,
    itemBuilder: (context, int index) {
      return Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsUnit.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(
              Icons.person,
              size: 30,
              color: ColorsUnit.theamColor,
            ),
            title: Text(name, style: userRequest),
            subtitle: Row(
              children: [
                const Text('Time', style: subHeading),
                const SizedBox(width: 20),
                const Text('Date', style: subHeading),
                const SizedBox(width: 20),
                Text(reqType, style: subHeading),
              ],
            ),
          ),
        ),
      );
    },
  );
}
