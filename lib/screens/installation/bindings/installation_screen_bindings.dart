import 'package:get/get.dart';
import 'package:operations/screens/installation/controller/installation_screen_controller.dart';

class InstallationControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstallationScreenController());
  }
}
