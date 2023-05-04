import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors.dart';

//loginButtons
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phoneNoController = TextEditingController();
//registration buttons
final TextEditingController passwordControllers = TextEditingController();
final TextEditingController confirmpassController = TextEditingController();
final TextEditingController name = TextEditingController();
final TextEditingController emailControllers = TextEditingController();
final TextEditingController mobile = TextEditingController();

//LoginButtons
final password = TextFormField(
  obscureText: true,
  autofocus: false,
  validator: ((value) {
    RegExp regExp = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Please enter your Password");
    }
    if (!regExp.hasMatch(value)) {
      return ("Please enter Valid Password(Min, 6 character");
    }
    return null;
  }),
  onSaved: (value) {
    passwordController.text = value!;
  },
  textInputAction: TextInputAction.done,
  controller: passwordController,
  decoration: const InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: 'Password',
    labelStyle: TextStyle(color: ColorsUnit.theamColor),
  ),
);
final cPassword = TextFormField(
  obscureText: true,
  autofocus: false,
  validator: ((value) {
    RegExp regExp = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Please confirm your Password");
    }
    if (!regExp.hasMatch(value)) {
      return ("Please enter Valid Password(Min, 6 character");
    }
    return null;
  }),
  onSaved: (value) {
    confirmpassController.text = value!;
  },
  textInputAction: TextInputAction.done,
  controller: confirmpassController,
  decoration: const InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: 'Confirm Password',
    labelStyle: TextStyle(color: ColorsUnit.theamColor),
  ),
);
final email = TextFormField(
  autofocus: false,
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  enabled: true,
  validator: ((value) {
    if (value!.isEmpty) {
      return ("Plaese enter your email.");
    }
    //reg
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]").hasMatch(value)) {
      return ("Plaese enter valid email.");
    }
    return null;
  }),
  onSaved: (value) {
    emailController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: 'Email',
    labelStyle: TextStyle(color: ColorsUnit.theamColor),
  ),
);
final phone = TextFormField(
  autofocus: false,
  controller: phoneNoController,
  keyboardType: TextInputType.number,
  onSaved: (value) {
    phoneNoController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: 'Phone',
    labelStyle: TextStyle(color: ColorsUnit.theamColor),
  ),
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    FilteringTextInputFormatter.digitsOnly
  ],
);

//RegistrationBUttons
Widget animatedText(String title) {
  return AnimatedTextKit(
    animatedTexts: [
      TyperAnimatedText(title,
          textStyle: const TextStyle(
              color: Colors.orange, fontSize: 20, fontWeight: FontWeight.w500),
          speed: const Duration(milliseconds: 500)),
    ],
    isRepeatingAnimation: true,
    totalRepeatCount: 2,
  );
}
