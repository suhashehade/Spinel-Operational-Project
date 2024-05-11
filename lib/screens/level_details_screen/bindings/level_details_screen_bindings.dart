import 'package:get/get.dart';
import 'package:operations/screens/level_details_screen/controller/level_details_screen_controller.dart';

class LevelDetailsControllerBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LevelDetailsScreenController());
  }


}