import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergencyapp/credintial/user_login_screen/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../widgets/text_controller.dart';
// import 'model.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  _RegisterationState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = ['User', 'Police', 'Ambulance', 'FireBigade'];
  var _currentItemSelected = "User";
  var rool = "User";
  @override
  void dispose() {
    passwordControllers.dispose();
    confirmpassController.dispose();
    emailControllers.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 10;
    var height = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: width, horizontal: height),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formkey,
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
                    animatedText('Register Here!'),
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: ColorsUnit.theamColor),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Full Name',
                        enabled: true,
                        contentPadding:
                            EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailControllers,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: ColorsUnit.theamColor),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        enabled: true,
                        contentPadding:
                            EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: _isObscure,
                      controller: passwordControllers,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            const TextStyle(color: ColorsUnit.theamColor),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorsUnit.theamColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        enabledBorder: const UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: _isObscure2,
                      controller: confirmpassController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            const TextStyle(color: ColorsUnit.theamColor),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorsUnit.theamColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure2 = !_isObscure2;
                              });
                            }),
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.white,
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        enabledBorder: const UnderlineInputBorder(),
                      ),
                      validator: (value) {
                        if (confirmpassController.text !=
                            passwordController.text) {
                          return "Password did not match";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Role : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsUnit.theamColor,
                          ),
                        ),
                        DropdownButton<String>(
                          dropdownColor: ColorsUnit.white,
                          isDense: true,
                          isExpanded: false,
                          iconEnabledColor: ColorsUnit.theamColor,
                          focusColor: ColorsUnit.theamColor,
                          items: options.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                      color: ColorsUnit.theamColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ));
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              _currentItemSelected = newValueSelected!;
                              rool = newValueSelected;
                            });
                          },
                          value: _currentItemSelected,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      elevation: 5.0,
                      height: 40,
                      onPressed: () {
                        print(name);
                        print(emailControllers.text);
                        print(passwordControllers.text);
                        print(rool);
                        setState(() {
                          showProgress = true;
                        });
                        signUp(emailControllers.text, passwordControllers.text,
                            rool);
                      },
                      color: ColorsUnit.theamColor,
                      textColor: ColorsUnit.white,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'LogIn',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password, String rool) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool)})
          .catchError((e) {
        print(e);
      });
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref
        .doc(user!.uid)
        .set({'email': emailController.text.trim(), 'rool': rool});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
