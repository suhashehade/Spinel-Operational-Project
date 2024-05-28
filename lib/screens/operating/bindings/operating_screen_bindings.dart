import 'package:get/get.dart';
import 'package:operations/screens/operating/controller/operating_screen_controller.dart';

class OperatingControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OperatingScreenController());
  }
}
