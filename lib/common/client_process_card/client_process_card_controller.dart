import 'package:get/get.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/services/shared_preferences_service.dart';

class ProcessClientCardController extends GetxController {
  toggleOpenProcessCard(InstallationClientProcess process) {
    process.isOpened.value = !process.isOpened.value;
  }

  showDetailsDialog(InstallationClientProcess process) {
    String? key = PrefsService.to.getString('Client');
    Get.dialog(const ProcessDetailsDialog(),
        arguments: {'process': process, 'loginType': key, 'from': 'card', 'type': 'installation'});
  }
}
