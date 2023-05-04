import 'dart:io';

import 'package:emergencyapp/credintial/ambulace_login_screen/ambulance_home_screen.dart';
import 'package:emergencyapp/credintial/firebigade_screen/fire_home_screen.dart';
import 'package:emergencyapp/credintial/police_login_screen/police_home_screen.dart';
import 'package:emergencyapp/credintial/police_login_screen/police_login.dart';
import 'package:emergencyapp/screens/home_screen.dart';
import 'package:emergencyapp/screens/services/ambulance_service.dart';
import 'package:emergencyapp/screens/services/firebigade_service.dart';
import 'package:emergencyapp/screens/services/police_req.dart';
import 'package:emergencyapp/screens/services/police_service.dart';
import 'package:emergencyapp/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'credintial/ambulace_login_screen/ambulance_login.dart';
import 'credintial/firebigade_screen/firebigade_login.dart';
import 'credintial/user_login_screen/forgot_password_screen.dart';
import 'credintial/user_login_screen/sign_up_screen.dart';
import 'credintial/user_login_screen/user_login.dart';
import 'screens/services/ambulance_req.dart';
import 'screens/services/firebigade_req.dart';
import 'utils/my_routes.dart';
import 'utils/theams.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheam.lightTheam,
        home: const SplashScreen(),
        routes: {
          MYRoutes.homeScreen: (context) => const HomeScreen(),
          MYRoutes.loginScreen: (context) => const LoginScreen(),
          MYRoutes.signUp: (context) => const Registeration(),
          MYRoutes.forgotPassword: (context) => const ForgotPassword(),
          MYRoutes.policeRoot: (context) => const PoliceService(),
          MYRoutes.ambulnaceRoot: (context) => const AmbulanceService(),
          MYRoutes.firebigadeRoot: (context) => const FireBigadeService(),
          MYRoutes.userLogin: (context) => const LoginScreen(),
          MYRoutes.policeLogin: (context) => const PoliceLogin(),
          MYRoutes.ambulanceLogin: (context) => const AmbulanceLogin(),
          MYRoutes.firebigadeLogin: (context) => const FireBigadeLogin(),
          MYRoutes.policeHome: (context) => const PoliceHomeScreen(),
          MYRoutes.ambulanceHome: (context) => const AmbulanceHomeScreen(),
          MYRoutes.firebigadeHome: (context) => const FirebigadeHomeScreen(),
          MYRoutes.policeReq: (context) => const PoliceRequestScreen(),
          MYRoutes.ambulanceReq: (context) => const AmbulanceRequestScreen(),
          MYRoutes.firebigadeReq: (context) => const FirebigadeRequestScreen(),
        },
      ),
    );
  }
}
