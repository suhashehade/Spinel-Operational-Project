import 'package:get/get.dart';
import 'package:operations/common/dialogs/processes_dialog/processes_dialog_controller.dart';
import 'package:operations/models/installation/installation_client_process_details_body.dart';
import 'package:operations/models/installation/installation_process_details_items_body.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/installation/installation_process_details_item.dart';
import 'package:operations/models/installation/installation_process_details_initial.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';

class ProcessDetailsDialogController extends GetxController {
  RxBool isFloatingClicked = false.obs;
  RxBool isLoading = false.obs;
  RxDouble progress = 0.0.obs;
  Rx<InstallationProcess> process =
      InstallationProcess(0, 0, '', '', '', 0.0, 0.0, 0).obs;
  Rx<InstallationClientProcess> clientProcess =
      InstallationClientProcess(0, 0, '', '', '', 0, '', '', '', 0.0).obs;
  RxList<InstallationProcessDetailsItem> processDetailsItems =
      <InstallationProcessDetailsItem>[].obs;
  RxList<InstallationDetailsInitialItems> processDetailsInitialItems =
      <InstallationDetailsInitialItems>[].obs;
  toggleIcon() {
    isFloatingClicked.value = !isFloatingClicked.value;
  }

  toogleIsOpened(item) {
    item.isOpened.value = !item.isOpened.value;
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  getProcessDetails() async {
    isLoading.value = true;
    if (Get.arguments['type'] == 'Admin') {
      processDetailsItems.value =
          await InstallationsAPI.getInstallationsProcessesDetails(
              process.value.detailsID!);
      if (processDetailsItems.isEmpty) {
        processDetailsInitialItems.value =
            await InstallationsAPI.getInstallationsProcessDetailsInitialItems(
                process.value.processID!);

        processDetailsItems.value = toDetailsItems(processDetailsInitialItems);
      }
    } else {
      processDetailsItems.value =
          await InstallationsAPI.getInstallationsClientProcessesDetails(
              clientProcess.value.detailsID!);
      if (processDetailsItems.isEmpty) {
        processDetailsInitialItems.value = await InstallationsAPI
            .getInstallationsClientProcessDetailsInitialItems(
                clientProcess.value.processID!);
        processDetailsItems.value = toDetailsItems(processDetailsInitialItems);
      }
    }

    isLoading.value = false;
  }

  toggleIsSkipped(InstallationProcessDetailsItem item) {
    item.isSkipped.value = !item.isSkipped.value;
    item.isConfirm.value = false;
    item.isNo.value = false;
    item.isYes.value = false;
  }

  toggleIsConfirmed(InstallationProcessDetailsItem item) {
    item.isConfirm.value = !item.isConfirm.value;
    item.isSkipped.value = false;
    item.isNo.value = false;
    item.isYes.value = false;
  }

  toggleIsNo(InstallationProcessDetailsItem item) {
    item.isNo.value = !item.isNo.value;
    item.isSkipped.value = false;
    item.isConfirm.value = false;
    item.isYes.value = false;
  }

  toggleIsYes(InstallationProcessDetailsItem item) {
    item.isYes.value = !item.isYes.value;
    item.isSkipped.value = false;
    item.isConfirm.value = false;
    item.isNo.value = false;
  }

  save() async {
    if (Get.arguments['type'] == 'Admin') {
      InstallationProcessDetailsItemsBody body =
          InstallationProcessDetailsItemsBody(
              process.value.detailsID!, processDetailsItems);
      await InstallationsAPI.saveProcessDetailsItems(body);
    } else {
      InstallationClientProcessDetailsBody body =
          InstallationClientProcessDetailsBody(
              clientProcess.value.detailsID!, processDetailsItems);
      await InstallationsAPI.saveClientProcessDetailsItems(body);
    }
    if (Get.arguments['from'] == 'card') {
      await Get.find<InstallationDetailsScreenController>().getProcesses();
    } else {
      await Get.find<ProcessesDialogController>().getProcesses();
    }

    Get.back();
  }

  List<InstallationProcessDetailsItem> toDetailsItems(
      List<InstallationDetailsInitialItems> initialItems) {
    List<InstallationProcessDetailsItem> items = [];

    items = initialItems
        .map((initialItem) => InstallationProcessDetailsItem(
              null,
              initialItem.value,
              initialItem.labelEn,
              false,
              false,
              false,
              false,
              initialItem.amount!,
              '',
            ))
        .toList();

    return items;
  }

  @override
  void onInit() async {
    print(PrefsService.to.getString(Consts.tokenKey));
    if (Get.arguments['type'] == 'Admin') {
      process.value = Get.arguments['process'];
      progress.value = process.value.progress!.value;
    } else {
      clientProcess.value = Get.arguments['process'];
      progress.value = clientProcess.value.progress!.value;
    }
    await getProcessDetails();
    super.onInit();
  }
}
