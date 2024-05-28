import 'package:get/get.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/models/installation/installation_details.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';

class ProcessesDialogController extends GetxController {
  late Installation installation;
  late Operating operating;
  RxDouble progress = 0.0.obs;
  Rx<InstallationDetails> installationDetails = InstallationDetails(
      0,
      0,
      '',
      '',
      '',
      0,
      '',
      '',
      '',
      '',
      '',
      0,
      '',
      '',
      0,
      '',
      '',
      '',
      '',
      '',
      0,
      '',
      '',
      '',
      '',
      '',
      0,
      '',
      0.0,
      0,
      '',
      false,
      '', []).obs;
  RxList<InstallationProcess> processes = <InstallationProcess>[].obs;
  RxList<InstallationClientProcess> clientProcesses =
      <InstallationClientProcess>[].obs;
  RxList<OperatingProcess> operatingProcess = <OperatingProcess>[].obs;
  RxBool isLoading = false.obs;

  getProcesses() async {
    isLoading.value = true;
    if (Get.arguments['type'] == 'installation') {
      if (PrefsService.to.getString(Consts.userKey) == 'Admin') {
        processes.value =
            await InstallationsAPI.getOperationsInstallationsProcesses(
                installation);
      } else {
        clientProcesses.value =
            await InstallationsAPI.getOperationsInstallationsClientProcesses(
                installation);
      }
    } else {
      operatingProcess.value =
          await OperatingAPI.getOperationsOperatingProcesses(operating);
    }

    isLoading.value = false;
  }

  showDetailsDialog(process) {
    String? key = PrefsService.to.getString(Consts.userKey);
    if (Get.arguments['type'] == 'installation') {
      Get.dialog(const ProcessDetailsDialog(), arguments: {
        'process': process,
        'loginType': key,
        'from': 'dialog',
        'type': 'installation'
      });
    } else {
      Get.dialog(const ProcessDetailsDialog(), arguments: {
        'process': process,
        'loginType': key,
        'from': 'dialog',
        'type': 'operating'
      });
    }
  }

  @override
  void onInit() async {
    if (Get.arguments['type'] == 'installation') {
      installation = Get.arguments['installation'];
      progress.value = installation.totalProgress!.value;
    } else {
      operating = Get.arguments['operating'];
      progress.value = operating.totalProgress!.value;
    }

    await getProcesses();
    super.onInit();
  }
}
