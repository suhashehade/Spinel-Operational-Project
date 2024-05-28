import 'package:get/get.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/models/operating/operating_client_process.dart';
import 'package:operations/services/shared_preferences_service.dart';

class OperatingProcessClientCardController extends GetxController {
  toggleOpenProcessCard(OperatingClientProcess process) {
    process.isOpened.value = !process.isOpened.value;
  }

  showDetailsDialog(InstallationClientProcess process) {
    String? key = PrefsService.to.getString('Client');
    Get.dialog(const ProcessDetailsDialog(),
        arguments: {'process': process, 'type': key, 'from': 'card'});
  }
  
}
