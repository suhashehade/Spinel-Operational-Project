import 'dart:async';

import 'package:get/get.dart';
import 'package:operations/utils/routes.dart';

class SplashScreenController extends GetxController {
  toLoginScreen() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed(Routes.loginScreen);
    });
  }
}
