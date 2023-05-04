import 'package:emergencyapp/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import '../credintial/credintial_screen.dart';
import '../credintial/user_login_screen/sign_up_screen.dart';
import '../utils/text_file.dart';

class MyHome extends StatelessWidget {
  final Color kDarkBlueColor = const Color.fromARGB(255, 4, 40, 70);

  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    var imageHeight = MediaQuery.of(context).size.width;
    var imageWidth = MediaQuery.of(context).size.width;
    return OnBoardingSlider(
      finishButtonText: TextFile.finishButtonText,
      // finishButtonStyle: const FinishButtonStyle(
      //   backgroundColor: ColorsUnit.theamColor,
      // ),
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const Registeration(),
          ),
        );
      },
      skipTextButton: Text(
        TextFile.skipTextButton,
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        TextFile.login,
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const CredintialSreeen(),
          ),
        );
      },
      controllerColor: kDarkBlueColor,
      totalPage: 4,
      headerBackgroundColor: ColorsUnit.white,
      pageBackgroundColor: ColorsUnit.white,
      background: [
        Image.network(
            height: imageHeight,
            'http://www.clker.com/cliparts/8/a/4/f/13682985232068443880ambulance-icon-hi.png'),
        Image.network(
            height: imageHeight,
            'https://tse2.mm.bing.net/th?id=OIP.kmkN0A1sL2jq1W1q6rv3bQHaFQ&pid=Api&P=0'),
        Image.network(
            height: imageHeight,
            'https://cdn1.iconfinder.com/data/icons/transportation-front-view-1/128/Police-car-cop-emergency-crime-512.png'),
        Image.network(
            height: imageHeight,
            'https://images.vexels.com/media/users/3/199915/isolated/preview/239c2e42e1063eaf2057bfae9e3299e9-emergency-call-textured-by-vexels.png'),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                TextFile.ambulanceService,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TextFile.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                TextFile.fireBrigde,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TextFile.text2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                TextFile.policeService,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TextFile.text3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 40, vertical: imageWidth / 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                TextFile.startNow,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TextFile.saveLife,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
