import 'package:get/get.dart';
import 'package:operations/screens/order_details_screen/controller/order_details_screen_controller.dart';

class OrderDetailsControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsScreenController());
  }
}
