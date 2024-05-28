import 'package:get/get.dart';
import 'package:operations/screens/operating_details/controller/operating_details_screen_controller.dart';

class OperatingDetailsControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OperatingDetailsScreenController());
  }
}
