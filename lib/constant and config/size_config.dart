
import 'package:get/get.dart';

class SizeConfig {
// Get the proportionate height as per screen size
 static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = Get.size.height;
    // 812 is the layout height that designer use
    return (inputHeight / 926) * screenHeight;
  }

// Get the proportionate height as per screen size
 static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = Get.size.width;
    // 375 is the layout width that designer use
    return (inputWidth / 428) * screenWidth;
  }
}
