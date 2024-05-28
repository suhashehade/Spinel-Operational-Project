import 'package:get/get.dart';
import 'package:operations/common/dialogs/add_other_cost_dialog/add_other_cost_dialog.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/api/operating_api.dart';

class OtherCostsDialogController extends GetxController {
  Rx<InstallationProcess> process =
      InstallationProcess(0, 0, '', '', '', 0.0, 0.0, 0).obs;
  Rx<OperatingProcess> operatingProcess =
      OperatingProcess(0, 0, '', '', '', 0.0, 0.0, 0).obs;
  RxList<OtherCost> otherCosts = <OtherCost>[].obs;
  RxBool isLoading = false.obs;
  showAddOtherCost() {
    if (Get.arguments['type'] == 'operating') {
      Get.dialog(AddOtherCostDialog(), arguments: {
        'process': operatingProcess.value,
        'type': 'operating',
      });
    } else {
      Get.dialog(AddOtherCostDialog(), arguments: {
        'process': process.value,
        'type': 'installation',
      });
    }
  }

  getOtherCosts() async {
    isLoading.value = true;
    if (Get.arguments['type'] == 'operating') {
      otherCosts.value =
          await OperatingAPI.getOtherCosts(operatingProcess.value);
    } else {
      otherCosts.value = await InstallationsAPI.getOtherCosts(process.value);
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    if (Get.arguments['type'] == 'operating') {
      if (Get.arguments['process'] != null) {
        operatingProcess.value = Get.arguments['process'];
      }
    } else {
      if (Get.arguments['process'] != null) {
        process.value = Get.arguments['process'];
      }
    }

    await getOtherCosts();
    super.onInit();
  }
}
