import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog_controller.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/cost/other_cost_add_body.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/utils/messages.dart';

class AddOtherCostDialogController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController costNoteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late InstallationProcess process;
  late OperatingProcess operatingProcess;
  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  addOtherCost() async {
    OtherCost otherCost;
    OtherCostsDialogController otherCostsDialogController = Get.find();
    if (Get.arguments['type'] == 'installation') {
      OtherCostBody otherCostBody = OtherCostBody(
        process.detailsID!,
        double.parse(amountController.text),
        descriptionController.text,
      );
      await InstallationsAPI.addOtherCost(otherCostBody);
      otherCost = OtherCost(
        process.detailsID,
        double.parse(amountController.text),
        descriptionController.text,
        costNoteController.text,
      );
      otherCostsDialogController.otherCosts.add(otherCost);
    } else {
      OtherCostBody otherCostBody = OtherCostBody(
        operatingProcess.detailsID!,
        double.parse(amountController.text),
        descriptionController.text,
      );
      otherCost = OtherCost(
        operatingProcess.detailsID,
        double.parse(amountController.text),
        descriptionController.text,
        costNoteController.text,
      );
      await OperatingAPI.addOtherCost(otherCostBody);
      otherCostsDialogController.otherCosts.add(otherCost);
    }

    Get.back();
  }

  @override
  void onInit() {
    if (Get.arguments['type'] == 'installation') {
      process = Get.arguments['process'];
    } else {
      operatingProcess = Get.arguments['process'];
    }

    super.onInit();
  }
}
