import 'package:get/get.dart';
import 'package:operations/screens/main_screen/controller/main_screen_controller.dart';

class MainControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
  }
}
