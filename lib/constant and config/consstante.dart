import 'package:flutter/material.dart';

//const primaryColor = Color(0xFFADEE9F);
const primaryColor = Color(0xFF139D51);
const appBarColor = Color.fromARGB(255, 216, 237, 228);
const secondaryColor = Color(0xFF667080);
const errorcolor = Color(0xFFF0810F);
const blackcolor = Color(0xFF000000);
const whitecolor = Color(0xFFFFFFFF);
const redcolor = Color(0xFFDC2626);
const redlightcolor = Color(0xFFFEF2F2);
const greylightycolor = Color(0xFFF4F4F5);

const textstyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);

const textFormDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(15))));
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
