import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreenController extends GetxController {
  void openDrawer() {
    Get.find<GlobalKey<ScaffoldState>>().currentState!.openDrawer();
  }
}
