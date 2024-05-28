import 'package:get/get.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/models/operating/operating_details.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';

class OperatingProcessesDialogController extends GetxController {
  late Operating operating;
  RxDouble progress = 0.0.obs;
  Rx<OperatingDetails> operatingDetails = OperatingDetails(
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
  RxList<OperatingProcess> processes = <OperatingProcess>[].obs;
  RxBool isLoading = false.obs;

  getProcesses() async {
    isLoading.value = true;
    processes.value =
        await OperatingAPI.getOperationsOperatingProcesses(operating);
    isLoading.value = false;
  }

  showDetailsDialog(process) {
    String? key = PrefsService.to.getString(Consts.userKey);
    Get.dialog(const ProcessDetailsDialog(),
        arguments: {'process': process, 'type': key, 'from': 'dialog'});
  }

  @override
  void onInit() async {
    operating = Get.arguments['operating'];
    progress.value = operating.totalProgress!.value;
    await getProcesses();
    super.onInit();
  }
}
