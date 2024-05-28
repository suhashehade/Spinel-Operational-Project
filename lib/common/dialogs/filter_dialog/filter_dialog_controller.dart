import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/models/client/client.dart';
import 'package:operations/screens/installation/controller/installation_screen_controller.dart';
import 'package:operations/screens/operating/controller/operating_screen_controller.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/messages.dart';

class FiltersDialogController extends GetxController {
  TextEditingController orderDateController = TextEditingController();
  TextEditingController idController = TextEditingController();

  RxBool dateFilterIsExppanded = false.obs;
  RxBool idFilterIsExppanded = false.obs;
  RxBool cityFilterIsExppanded = false.obs;
  RxBool governFilterIsExppanded = false.obs;
  RxBool clientFilterIsExppanded = false.obs;
  RxList cites = [].obs;
  RxList governs = [].obs;
  RxList<Client> clients = <Client>[].obs;
  RxInt selectedCityId = 0.obs;
  RxInt selectedGovernId = 0.obs;
  RxString selectedClientId = ''.obs;
  int page = 1;
  int pageSize = 10;
  RxBool isLoading = false.obs;

  toggleDateFilterExpand() {
    dateFilterIsExppanded.value = !dateFilterIsExppanded.value;
  }

  toggleIdFilterExpand() {
    idFilterIsExppanded.value = !idFilterIsExppanded.value;
  }

  toggleCityFilterExpand() {
    cityFilterIsExppanded.value = !cityFilterIsExppanded.value;
  }

  toggleGovernFilterExpand() {
    governFilterIsExppanded.value = !governFilterIsExppanded.value;
  }

  toggleClientFilterExpand() {
    clientFilterIsExppanded.value = !clientFilterIsExppanded.value;
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  //   void loadMoreItems() {
  //   filterrr(key, value,true);
  // }

  // ScrollController scrollController = ScrollController();
  filterrr(key, value) async {
    // if (!Get.find<InstallationScreenController>().hasMore.value) {
    //   Get.find<InstallationScreenController>().installations.clear();
    //   page = 1;
    //   Get.find<InstallationScreenController>().hasMore.value = true;
    // }

    Get.find<InstallationScreenController>().isLoading.value = true;

    try {
      var newInstallations =
          await InstallationsAPI.getOperationInstallationsList(
              key, value.toString(), '', page, pageSize);
      if (newInstallations.isEmpty) {
        Get.find<InstallationScreenController>().hasMore.value = false;
      } else {
        Get.find<InstallationScreenController>()
            .installations
            .addAll(newInstallations);
        page++;
      }
    } finally {
      Get.find<InstallationScreenController>().isLoading.value = false;
    }
  }

  filter(key, value) async {
    if (PrefsService.to.getString('currentView') == 'installation') {
      isLoading.value = true;
      Get.find<InstallationScreenController>().installations.value =
          await InstallationsAPI.getOperationInstallationsList(
              key, value.toString(), '', page, pageSize);

      isLoading.value = false;

      update();

      if (value == '') {
        Get.find<InstallationScreenController>().pageSize = 10;
        Get.find<InstallationScreenController>().page = 1;
        Get.find<InstallationScreenController>().installations.clear();
        await Get.find<InstallationScreenController>().getInstallationsList();
        Get.back();
      }
    } else {
      isLoading.value = true;
      Get.find<OperatingScreenController>().operatings.value =
          await OperatingAPI.getOperationOperatingList(
              key, value.toString(), '', page, pageSize);
      isLoading.value = false;
    
      update();
      if (value == '') {
        Get.find<OperatingScreenController>().pageSize = 10;
        Get.find<OperatingScreenController>().page = 1;
        Get.find<OperatingScreenController>().operatings.clear();
        await Get.find<OperatingScreenController>().getOperatingsList();
        Get.back();
      }
    }

    Get.back();
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMd().format(pickedDate);
      controller.text = formattedDate;
    }
    filter('Date', orderDateController.text);
    Get.back();
  }

  String? validateCity(value) {
    if (value == 0) {
      return "Select City";
    }

    return null;
  }

  String? validateGovern(value) {
    if (value == 0) {
      return "Select Govern";
    }

    return null;
  }

  String? validateClient(value) {
    if (value == '') {
      return "Select Client";
    }

    return null;
  }

  upadateSelectedCityId(value) {
    selectedCityId.value = value;
  }

  upadateSelectedGovernId(value) {
    selectedGovernId.value = value;
  }

  upadateSelectedClientId(value) {
    selectedClientId.value = value;
  }

  getCities() async {
    cites.value = await InstallationsAPI.getCities();
  }

  getGoverns() async {
    governs.value = await InstallationsAPI.getGoverns();
  }

  getClients() async {
    clients.value = await InstallationsAPI.getClients();
  }

  @override
  void onInit() async {
    await getCities();
    await getGoverns();
    await getClients();
    super.onInit();
  }
}
