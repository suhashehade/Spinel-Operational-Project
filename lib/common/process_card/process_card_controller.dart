import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class ProcessCardController extends GetxController {
  toggleOpenProcessCard(process) {
    process.isOpened.value = !process.isOpened.value;
  }

  showDetailsDialog(process) {
    String? key = PrefsService.to.getString(Consts.userKey);
    if (process.runtimeType == InstallationProcess) {
      Get.dialog(const ProcessDetailsDialog(), arguments: {
        'process': process,
        'loginType': key,
        'from': 'card',
        'type': 'installation'
      });
    } else {
      Get.dialog(const ProcessDetailsDialog(), arguments: {
        'process': process,
        'loginType': key,
        'from': 'card',
        'type': 'operating'
      });
    }
  }

  showOtherCostsDialog(process) {
    if (process.runtimeType == InstallationProcess) {
      Get.bottomSheet(
        const OtherCostsDialog(),
        settings: RouteSettings(
            arguments: {'process': process, 'type': 'installation'}),
        backgroundColor: CustomColors.lion,
      );
    } else {
      Get.bottomSheet(
        const OtherCostsDialog(),
        settings:
            RouteSettings(arguments: {'process': process, 'type': 'operating'}),
        backgroundColor: CustomColors.lion,
      );
    }
  }
}
