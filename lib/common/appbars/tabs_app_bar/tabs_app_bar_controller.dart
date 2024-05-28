import 'package:get/get.dart';

class TabsAppBarController extends GetxController {
  RxInt index = 0.obs;

  changeIndex(int currentIndex) {
    index.value = currentIndex;
  }
}
