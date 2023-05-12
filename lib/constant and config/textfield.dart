// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mos/constant%20and%20config/config.dart';
import 'package:mos/constant%20and%20config/consstante.dart';
import 'package:mos/constant%20and%20config/size_config.dart';
import 'package:get/get.dart';

class TextFormInput extends StatelessWidget {
  TextFormInput(
      {required this.controller,
      this.readOnly = false,
      this.number = false,
      this.multiline = false,
      this.hintText,
      this.suffixIcon,
      this.preffixIcon,
      this.filledColor = false,
      this.validator,
      this.obsecure = false,
      Key? key})
      : super(key: key);

  FormFieldValidator<String>? validator;
  bool obsecure;
  bool multiline;
  bool number;
  bool readOnly;
  TextEditingController controller;
  String? hintText;
  bool filledColor;
  Widget? suffixIcon;
  Widget? preffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.getProportionateScreenHeight(0),
        SizeConfig.getProportionateScreenHeight(13),
        SizeConfig.getProportionateScreenHeight(0),
        SizeConfig.getProportionateScreenHeight(10),
      ),
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: number ? TextInputType.phone : TextInputType.text,
        textAlign: TextAlign.start,
        controller: controller,
        maxLines: multiline ? 5 : 1,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('#9CA3AF')),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: redcolor),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: redcolor),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor('#9CA3AF')),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: (hintText != null) ? hintText?.tr : hintText,
            // hintText: '',
            contentPadding: EdgeInsets.only(
                right: SizeConfig.getProportionateScreenWidth(10),
                left: SizeConfig.getProportionateScreenWidth(15),
                top: SizeConfig.getProportionateScreenWidth(32)),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon),
        validator: validator,
        obscureText: obsecure,
      ),
    );
  }
}
