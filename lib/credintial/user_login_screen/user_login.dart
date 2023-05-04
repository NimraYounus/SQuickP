import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergencyapp/credintial/ambulace_login_screen/ambulance_home_screen.dart';
import 'package:emergencyapp/credintial/firebigade_screen/fire_home_screen.dart';
import 'package:emergencyapp/credintial/police_login_screen/police_home_screen.dart';
import 'package:emergencyapp/credintial/user_login_screen/sign_up_screen.dart';
import 'package:emergencyapp/screens/home_screen.dart';
import 'package:emergencyapp/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/text_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure3 = true;
  bool visible = false;

  String? errorMessage;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var source;
    // var destination;
    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsUnit.theamColor,
          foregroundColor: ColorsUnit.white),
      onPressed: () {
        setState(() {
          visible = true;
        });
        signIn(emailController.text, passwordController.text);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const HomeScreen(),
        //   ),
        // );
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
                animatedText('Login Here!'),
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
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visible,
                    child: const CircularProgressIndicator(
                      color: ColorsUnit.theamColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "User") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else if (documentSnapshot.get('rool') == "Police") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PoliceHomeScreen(),
            ),
          );
        } else if (documentSnapshot.get('rool') == "Ambulance") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AmbulanceHomeScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FirebigadeHomeScreen(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
