import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/services/api/auth_api.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class LoginScreenController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString errorMessage = ''.obs;
  RxBool isOpened = false.obs;
  RxString selectedType = 'Admin'.obs;
  toMainScreen() {
    Get.offNamed(Routes.dashboard);
  }

  toggle() {
    isOpened.value = !isOpened.value;
  }

  handleLogin() async {
    await AuthAPI.login(
        usernameController.text, passwordController.text, selectedType.value);
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  String? validateLoginType(value) {
    if (value == 0) {
      return "Select Type";
    }

    return null;
  }

  upadateSelectedType(String? value) {
    selectedType.value = value!;
  }

  toRegistrationScreen() {
    Get.offNamed(Routes.registrationScreen);
  }
}
