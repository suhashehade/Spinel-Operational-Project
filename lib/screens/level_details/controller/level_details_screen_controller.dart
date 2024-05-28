import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/dialogs/add_admin_dialog.dart';
import 'package:operations/common/dialogs/admin_dialog.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog_controller.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/installation/installation_process_details_item.dart';
import 'package:operations/models/installation/installation_process_details_initial.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';

class LevelDetailsScreenController extends GetxController {
  Rx<InstallationDetailsInitialItems> process =
      InstallationDetailsInitialItems(0, '', '', 0.0).obs;
  RxBool isOpened = false.obs;
  RxDouble totalCost = 0.0.obs;
  TextEditingController orderFromDateController = TextEditingController();
  TextEditingController orderToDateController = TextEditingController();
  TextEditingController adminController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController costNoteController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  toogleIsOpened(InstallationProcessDetailsItem item) {
    item.isOpened.value = !item.isOpened.value;
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMd().format(pickedDate);
      controller.text = formattedDate;
    }
  }

  calcualteTotal() {
    OtherCostsDialogController otherCostsDialogController =
        Get.put(OtherCostsDialogController());
    for (OtherCost c in otherCostsDialogController.otherCosts) {
      totalCost.value += c.amount!;
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

  showDetailsDialog() {
    // Get.defaultDialog(
    //   title: Consts.details.tr,
    //   content: ProcessDetailsDialog(process: process.value),
    // );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  @override
  void onInit() {
    process.value = Get.arguments['level'];
    // calcualteTotal();
    super.onInit();
  }
}
