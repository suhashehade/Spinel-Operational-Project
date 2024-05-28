import 'package:get/get.dart';

class SortItem {
  String name;
  RxBool isClicked;
  RxInt status;

  SortItem(this.name)
      : isClicked = false.obs,
        status = 0.obs;
}
