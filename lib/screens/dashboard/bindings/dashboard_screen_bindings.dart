import 'package:get/get.dart';
import 'package:operations/screens/dashboard/controller/dashboard_screen_controller.dart';

class DashboardControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardScreenController());
  }
}
