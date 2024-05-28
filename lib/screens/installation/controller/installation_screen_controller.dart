import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/processes_dialog/processes_dialog.dart';
import 'package:operations/common/dialogs/filter_dialog/filter_dialog.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class InstallationScreenController extends GetxController {
  RxBool statusFilterIsOpened = false.obs;
  RxBool isDialogOpen = false.obs;
  RxList<Installation> installations = <Installation>[].obs;
  RxList<InstallationProcess> processes = <InstallationProcess>[].obs;
  RxBool isLoading = false.obs;
  int page = 1;
  int pageSize = 10;
  RxBool hasMore = true.obs;
  RxInt rowCount = 0.obs;

  TextEditingController searchcontroller = TextEditingController();
  ScrollController scrollController = ScrollController();

  toggleStatusFilter() {
    statusFilterIsOpened.value = !statusFilterIsOpened.value;
  }

  toggleOpenInstallationCard(Installation order) {
    order.isOpened.value = !order.isOpened.value;
  }

  showSortDialog() {
    Get.bottomSheet(
      const FiltersDialog(),
      backgroundColor: CustomColors.lion,
    );
  }

  showProcessesDialog(Installation installation) async {
    isDialogOpen.value = true;
    Get.dialog(
      const ProcessesDialog(),
      arguments: {'installation': installation, 'type': 'installation'},
    );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  toInstalaltionDetails(Installation installation) {
    Get.toNamed(
      Routes.installationDetailsScreen,
      arguments: {'installation': installation},
    );
  }

  getInstallationsList() async {
    if (isLoading.value) return;
    isLoading.value = true;
    var newItems = await InstallationsAPI.getOperationInstallationsList(
        '', '', '', page, pageSize);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading.value &&
          rowCount.value != installations.length) {
        loadMoreItems();
      }
    });
    page++;
    installations.addAll(newItems);
    isLoading.value = false;
  }

  void loadMoreItems() {
    if (!isLoading.value) {
      getInstallationsList();
    }
  }

  search(value) async {
    isLoading.value = true;
    installations.clear();
    installations.value = await InstallationsAPI.getOperationInstallationsList(
        '', '', value, page, pageSize);
    isLoading.value = false;
    update();
    if (value == '') {
      pageSize = 10;
      page = 1;
      installations.clear();
      await getInstallationsList();
    }
  }

  @override
  void onInit() async {
    PrefsService.to.setString('currentView', 'installation');
    await getInstallationsList();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
