// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mos/constant%20and%20config/config.dart';
import 'package:mos/constant%20and%20config/size_config.dart';

class RoundedButton extends StatelessWidget {
  String title;
  Function()? onTap;
  double? width;

  RoundedButton(
      {Key? key, required this.title, required this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HexColor('#1C9E54')),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        height: fullHeight(context) * 0.059,
        width: width != null ? width : fullWidth(context),
        child: Text(
          title.tr,
          // textScaleFactor: 1.0,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: SizeConfig.getProportionateScreenWidth(15),
          ),
        ),
      ),
    );
  }
}
