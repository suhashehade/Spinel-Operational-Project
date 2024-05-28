import 'package:get/get.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';

class InstallationDetailsControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstallationDetailsScreenController());
  }
}
