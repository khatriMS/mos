import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mos/auth/FB.dart';
import 'package:mos/auth/LoginScreen.dart';
import 'package:mos/auth/SignUp.dart';
import 'package:mos/screen/homePage.dart';
import 'package:mos/map_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: LoginScreen(),
    routes: {
      "map": (context) => Map_scren(),
      "LoginScreen": (context) => LoginScreen(),
      "firebase": (context) => AuthGate(
            isforget: true,
          ),
      "HomePage": (context) => homePage(),
      "SignUp": (context) => SignUp(),
    },
  ));
}
