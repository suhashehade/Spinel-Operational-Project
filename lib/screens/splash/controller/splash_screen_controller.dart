import 'dart:async';

import 'package:get/get.dart';
import 'package:operations/utils/routes.dart';

class SplashScreenController extends GetxController {
  toLoginScreen() {
    Timer(const Duration(milliseconds: 1500), () {
      Get.offNamed(Routes.loginScreen);
    });
  }
}
