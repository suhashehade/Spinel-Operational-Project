import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/utils/routes.dart';

class LoginScreenController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  toMainScreen() {
    Get.offNamed(Routes.mainScreen);
  }

  handleLogin() {
    toMainScreen();
  }

  toRegistrationScreen() {
    Get.offNamed(Routes.registrationScreen);
  }
}
