import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/filter_dialog/filter_dialog.dart';
import 'package:operations/common/dialogs/processes_dialog/processes_dialog.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class OperatingScreenController extends GetxController {
  RxBool statusFilterIsOpened = false.obs;
  RxBool isDialogOpen = false.obs;
  RxList<Operating> operatings = <Operating>[].obs;
  RxList<OperatingProcess> processes = <OperatingProcess>[].obs;
  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  var page = 1;
  var pageSize = 10;
  var hasMore = true.obs;
  RxInt rowCount = 0.obs;
  TextEditingController searchcontroller = TextEditingController();

  toggleStatusFilter() {
    statusFilterIsOpened.value = !statusFilterIsOpened.value;
  }

  toggleOpenInstallationCard(Operating operating) {
    operating.isOpened.value = !operating.isOpened.value;
  }

  showSortDialog() {
    Get.bottomSheet(
      const FiltersDialog(),
      backgroundColor: CustomColors.lion,
    );
  }

  showProcessesDialog(Operating operating) async {
    isDialogOpen.value = true;
    Get.dialog(
      const ProcessesDialog(),
      arguments: {'operating': operating, 'type': 'operating'},
    );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  toOperatingDetails(Operating operating) {
    Get.toNamed(
      Routes.operatingDetailsScreen,
      arguments: {'operating': operating},
    );
  }

  getOperatingsList() async {
    if (isLoading.value) return;
    isLoading.value = true;
    var newItems = await OperatingAPI.getOperationOperatingList(
        '', '', '', page, pageSize);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading.value &&
          rowCount.value != operatings.length) {
        loadMoreItems();
      }
    });
    page++;
    operatings.addAll(newItems);
    isLoading.value = false;
  }

  void loadMoreItems() {
    if (!isLoading.value) {
      getOperatingsList();
    }
  }

  search(value) async {
    isLoading.value = true;
    operatings.clear();
    operatings.value = await OperatingAPI.getOperationOperatingList(
        '', '', value, page, pageSize);
    isLoading.value = false;
    update();
    if (value == '') {
      pageSize = 10;
      page = 1;
      operatings.clear();
      await getOperatingsList();
    }
  }

  @override
  void onInit() async {
    await getOperatingsList();
    PrefsService.to.setString('currentView', 'operating');
    super.onInit();
  }
}
