import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/routes.dart';

class CustomSideBarController extends GetxController {
  RxBool isSalesOpend = false.obs;
  RxBool isOperationsOpend = false.obs;
  RxBool isMaintenaceOpend = false.obs;
  RxBool isHrOpend = false.obs;

  TextEditingController searchController = TextEditingController();

  logout() {
    PrefsService.to.clear();
    Get.deleteAll();
    Get.toNamed(Routes.loginScreen);
  }

  toggleSales() {
    isSalesOpend.value = !isSalesOpend.value;
  }

  toggleOperations() {
    isOperationsOpend.value = !isOperationsOpend.value;
  }

  toggleMaintenance() {
    isMaintenaceOpend.value = !isMaintenaceOpend.value;
  }

  toggleHr() {
    isHrOpend.value = !isHrOpend.value;
  }

  toInstallation() {
    Get.back();
    PrefsService.to.setString('currentView', 'installation');
    Get.offNamed(Routes.installationScreen);
  }

  toOperating() {
    Get.back();
    PrefsService.to.setString('currentView', 'operating');
    Get.offNamed(Routes.operatingScreen);
  }

  toDashboard() {
    Get.back();
    Get.offNamed(Routes.dashboard);
  }
}
