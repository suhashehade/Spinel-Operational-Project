import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/utils/routes.dart';

class RegistrationScreenController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  handleRegistration() {
    Get.offNamed(Routes.mainScreen);
  }
}
