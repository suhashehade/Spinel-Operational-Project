import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/bottombar/custom_bottombar_controller.dart';
import 'package:operations/common/dialogs/filter_dialog.dart';
import 'package:operations/models/level/level.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class MainScreenController extends GetxController {
  RxString selectedStatus = ''.obs;
  RxBool statusFilterIsOpened = false.obs;

  TextEditingController searchcontroller = TextEditingController();
  TextEditingController orderFromDateController = TextEditingController();
  TextEditingController orderToDateController = TextEditingController();
  CustomBottomBarController customBottomBarController =
      Get.put(CustomBottomBarController());

  toggleStatusFilter() {
    statusFilterIsOpened.value = !statusFilterIsOpened.value;
  }

  updateType(status) {
    selectedStatus.value = status;
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      controller.text = formattedDate;
    }
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  void openDrawer() {
    Get.find<GlobalKey<ScaffoldState>>().currentState!.openDrawer();
  }

  toLevelDetails(Level l) {
    Get.toNamed(
      Routes.levelDetailsScreen,
      arguments: {'level': l},
    );
  }

  showFilterDialog() {
    Get.bottomSheet(const FilterDialog());
  }
}
