import 'package:get/get.dart';
import 'package:operations/screens/login_screen/controller/login_screen_controller.dart';

class LoginControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
