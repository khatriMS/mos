import 'package:flutter/material.dart';
import 'package:mos/auth/Login.dart';
import 'package:mos/home/homePage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: Login(),
    routes: {
      "Login": (context) => Login(),
      "HomePage": (context) => homePage(),
    },
  ));
}
