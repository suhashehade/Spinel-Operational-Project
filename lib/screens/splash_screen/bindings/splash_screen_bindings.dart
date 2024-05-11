import 'package:get/get.dart';
import 'package:operations/screens/splash_screen/controller/splash_screen_controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
