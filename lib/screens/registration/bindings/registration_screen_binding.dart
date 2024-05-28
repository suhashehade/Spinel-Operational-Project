import 'package:get/get.dart';
import 'package:operations/screens/registration/controller/registration_screen_controller.dart';

class RegistrationControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationScreenController());
  }
}
