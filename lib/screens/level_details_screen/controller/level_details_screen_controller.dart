import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/dialogs/add_admin_dialog.dart';
import 'package:operations/common/dialogs/add_other_cost_dialog.dart';
import 'package:operations/common/dialogs/admin_dialog.dart';
import 'package:operations/common/dialogs/level_details_dialog.dart';
import 'package:operations/common/dialogs/othter_costs_dialog.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/level/level.dart';
import 'package:operations/models/level/level_details_item.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';
import 'package:operations/utils/messages.dart';

class LevelDetailsScreenController extends GetxController {
  Rx<Level> level =
      Level('', '', '', '', '', '', '', '', '', '', false, 0.0).obs;
  RxBool isOpened = false.obs;
  RxInt totalCost = 0.obs;
  TextEditingController orderFromDateController = TextEditingController();
  TextEditingController orderToDateController = TextEditingController();
  TextEditingController adminController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController costNoteController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  toogleIsOpened(LevelDetailsItem item) {
    item.isOpened.value = !item.isOpened.value;
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      controller.text = formattedDate;
    }
  }

  calcualteTotal() {
    for (OtherCost c in Lists.otherCosts) {
      totalCost.value += c.amount;
    }
  }

  onTap() {}

  addAdmin() {
    Get.defaultDialog(
        title: Consts.addAdmin.tr,
        content: AddAdminDialog(
          controller: adminController,
          validator: validator,
          onTap: () {},
          handle: saveAdmin,
        ));
  }

  saveAdmin() {}

  showAdminDialog() {
    Get.defaultDialog(
      title: Consts.admins.tr,
      content: AdminsDialog(addFunction: addAdmin),
    );
  }

  showOtherCostsDialog() {
    Get.bottomSheet(const OtherCostsDialog());
  }

  showAddOtherCost() {
    Get.defaultDialog(
      title: Consts.addCost.tr,
      content: const AddOtherCostDialog(),
    );
  }

  showDetailsDialog() {
    Get.defaultDialog(
      title: Consts.details.tr,
      content: LevelDetailsDialog(level: level.value),
    );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  @override
  void onInit() {
    level.value = Get.arguments['level'];
    calcualteTotal();
    super.onInit();
  }
}
