import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emergencyapp/credintial/user_login_screen/sign_up_screen.dart';

import 'package:emergencyapp/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/text_controller.dart';

class AmbulanceLogin extends StatefulWidget {
  const AmbulanceLogin({Key? key}) : super(key: key);
  @override
  State<AmbulanceLogin> createState() => _AmbulanceLoginState();
}

class _AmbulanceLoginState extends State<AmbulanceLogin> {
  final _formKey = GlobalKey<FormState>();

  String? errorMessage;
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white),
      onPressed: () {
        //signIn(emailController.text, passwordController.text);
        Navigator.pushNamed(context, '/ambulanceHome');
      },
      child: const Text('Login'),
    );

    var width = MediaQuery.of(context).size.width / 10;
    var height = MediaQuery.of(context).size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: width, horizontal: height),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  height: 100,
                  width: 100,
                  'https://images.vexels.com/media/users/3/199915/isolated/preview/239c2e42e1063eaf2057bfae9e3299e9-emergency-call-textured-by-vexels.png',
                  fit: BoxFit.cover,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Ambulance Login Here!',
                        textStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        speed: const Duration(
                          milliseconds: 500,
                        )),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,
                ),
                Column(
                  children: [
                    email,
                    password,
                    const SizedBox(height: 10),
                    loginButton,
                    const SizedBox(height: 10),
                    const Text('or'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'Create one',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Registeration()),
                                        ),
                                      },
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: ColorsUnit.theamColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
