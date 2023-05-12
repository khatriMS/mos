library config.globals;

import 'package:flutter/cupertino.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double height10px(BuildContext context) {
  return MediaQuery.of(context).size.height * .01;
}

double width10px(BuildContext context) {
  return MediaQuery.of(context).size.width * .026;
}

double iconSize10(BuildContext context) {
  return MediaQuery.of(context).size.width * .023;
}

double fontSize10(BuildContext context) {
  return MediaQuery.of(context).size.width * .024;
}
