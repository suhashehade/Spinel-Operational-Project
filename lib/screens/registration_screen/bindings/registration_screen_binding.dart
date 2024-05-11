import 'package:get/get.dart';
import 'package:operations/screens/registration_screen/controller/registration_screen_controller.dart';

class RegistrationControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationScreenController());
  }
}
