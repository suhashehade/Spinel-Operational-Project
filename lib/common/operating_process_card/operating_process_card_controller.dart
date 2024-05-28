import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class OperatingProcessCard extends GetxController {
  toggleOpenProcessCard(process) {
    process.isOpened.value = !process.isOpened.value;
  }

  showDetailsDialog(process) {
    String? key = PrefsService.to.getString(Consts.userKey);
    Get.dialog(const ProcessDetailsDialog(),
        arguments: {'process': process, 'type': key, 'from': 'card'});
  }

  showOtherCostsDialog(process) {
    Get.bottomSheet(
      const OtherCostsDialog(),
      settings: RouteSettings(arguments: {'process': process}),
      backgroundColor: CustomColors.lion,
    );
  }
}
