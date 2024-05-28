import 'package:get/get.dart';
import 'package:operations/screens/splash/controller/splash_screen_controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
