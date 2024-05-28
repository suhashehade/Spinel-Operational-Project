import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/appbars/tabs_app_bar/tabs_app_bar_controller.dart';
import 'package:operations/common/dialogs/add_admin_dialog.dart';
import 'package:operations/common/dialogs/admin_dialog.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog_controller.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog.dart';
import 'package:operations/common/dialogs/sub_contractor_orders_dialog/sub_contractor_orders_dialog.dart';
import 'package:operations/models/comment/comment.dart';
import 'package:operations/models/comment/comment_body.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/models/installation/installation_details.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/installation/installation_process_details_item.dart';
import 'package:operations/models/installation/installation_service.dart';
import 'package:operations/models/lkps/lkps.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class InstallationDetailsScreenController extends GetxController {
  late Installation installation;
  RxDouble notesHeightRatio = 0.06.obs;
  RxBool statusFilterIsOpened = false.obs;
  RxBool isCustomerInfoShowed = false.obs;
  RxBool isBuildingInfoShowed = false.obs;
  RxBool isNotesExpanded = false.obs;
  int page = 1;
  int pageSize = 10;
  ScrollController scrollController = ScrollController();
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
  RxList<InstallationService> services = <InstallationService>[].obs;
  RxList<Comment> comments = <Comment>[].obs;
  RxList<Lookups> requestStatus = <Lookups>[].obs;
  RxBool isOpened = false.obs;
  RxDouble totalCost = 0.0.obs;
  RxBool isLoading = false.obs;
  RxBool isCommentsLoading = false.obs;
  TextEditingController orderStatusController = TextEditingController();
  TextEditingController orderDateController = TextEditingController();
  TextEditingController expiredDateController = TextEditingController();
  TextEditingController adminController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientCityController = TextEditingController();
  TextEditingController clientAddressController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController salesManController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController clientNotesController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  TextEditingController subContractorNameController = TextEditingController();
  TextEditingController subContractorPhoneController = TextEditingController();
  TextEditingController subContractorCompanyController =
      TextEditingController();
  TextEditingController subContractormobileController = TextEditingController();
  TextEditingController subContractorNationalNumberController =
      TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController currencyNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController subContractorCountryController =
      TextEditingController();
  TextEditingController subContractorGovernController = TextEditingController();
  TextEditingController subContractorCityController = TextEditingController();
  TextEditingController subContractorhasInsurenceController =
      TextEditingController();
  TabsAppBarController tabAppBarController = Get.put(TabsAppBarController());

  toggleStatusFilter() {
    statusFilterIsOpened.value = !statusFilterIsOpened.value;
  }

  toogleIsOpened(InstallationProcessDetailsItem item) {
    item.isOpened.value = !item.isOpened.value;
  }

  toggleCustomerInfoShow() {
    isCustomerInfoShowed.value = !isCustomerInfoShowed.value;
  }

  toggleBuildingInfoShow() {
    isBuildingInfoShowed.value = !isBuildingInfoShowed.value;
  }

  toggleOpenProcessCard(InstallationProcess process) {
    process.isOpened.value = !process.isOpened.value;
  }

  search(value) async {
    comments.value = comments
        .where((c) =>
            c.note!
                .toString()
                .toLowerCase()
                .startsWith(value.toString().toLowerCase()) ||
            c.recordAddBy!
                .toString()
                .toLowerCase()
                .startsWith(value.toString().toLowerCase()))
        .toList();
    if (value == '') {
      isLoading.value = true;
      await fillComments();
      isLoading.value = false;
    }
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMd().format(pickedDate);
      controller.text = formattedDate;
    }
  }

  calcualteTotal() {
    OtherCostsDialogController otherCostsDialogController =
        Get.put(OtherCostsDialogController());
    for (OtherCost c in otherCostsDialogController.otherCosts) {
      totalCost.value += c.amount!;
    }
  }

  addAdmin() {
    Get.defaultDialog(
        title: Consts.addAdmin.tr,
        backgroundColor: CustomColors.white,
        content: AddAdminDialog(
          controller: adminController,
          validator: validator,
          onTap: () {},
          handle: saveAdmin,
        ));
  }

  saveAdmin() {}

  showAdminDialog() {
    Get.defaultDialog(
      title: Consts.admins.tr,
      content: AdminsDialog(addFunction: addAdmin),
      backgroundColor: CustomColors.white,
    );
  }

  showOtherCostsDialog() {
    Get.bottomSheet(
      const OtherCostsDialog(),
      backgroundColor: CustomColors.white,
    );
  }

  showSubContractorOrdersDialog() {
    Get.dialog(
      const SubContractorOrdersDialog(),
      arguments: {'installation': installation},
    );
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  postComment() async {
    if (chatController.text != '') {
      CommentBody commentBody =
          CommentBody(installation.id!, 1, chatController.text);
      await InstallationsAPI.postComment(commentBody);
      await fillComments();
      chatController.text = '';
    }
  }

  expandNotes() {
    isNotesExpanded.value = !isNotesExpanded.value;
  }

  toLevelDetails(InstallationProcess l) {
    Get.toNamed(
      Routes.levelDetailsScreen,
      arguments: {'level': l},
    );
  }

  showDetailsDialog() {
    Get.bottomSheet(
      const ProcessDetailsDialog(),
    );
  }

  getProcesses() async {
    processes.value =
        await InstallationsAPI.getOperationsInstallationsProcesses(
            installation);
    clientProcesses.value =
        await InstallationsAPI.getOperationsInstallationsClientProcesses(
            installation);
  }

  getInstallationsDetails() async {
    isLoading.value = true;
    installationDetails.value =
        await InstallationsAPI.getOperationInstallationViewDetails(
            installation);
    isLoading.value = false;
  }

  fillMainInfoInputs() {
    clientNameController.text = installationDetails.value.clientNameAr ?? '';
    clientCityController.text = installationDetails.value.clientCityName ?? '';
    clientAddressController.text =
        installationDetails.value.clientAddress ?? '';

    buildingNameController.text = installationDetails.value.buildingName ?? '';
    floorController.text = installationDetails.value.buildingFloor ?? '';
    salesManController.text = installationDetails.value.salesManNameAr ?? '';
    notesController.text = installationDetails.value.notes ?? '';
    orderStatusController.text = requestStatus[0].labelEn;
  }

  fillProcesses() async {
    await getProcesses();
  }

  fillServices() {
    services.value = installationDetails.value.lstServices;
  }

  fillComments() async {
    comments.value = await InstallationsAPI.getComments(installation.id!, 1);
  }

  fillSubContractor() {
    subContractorNameController.text =
        installationDetails.value.subContractorAccNameAr ?? '';
    subContractorPhoneController.text =
        installationDetails.value.subContractorPhone ?? '';
    subContractorCompanyController.text =
        installationDetails.value.insCompany ?? '';
    subContractormobileController.text =
        installationDetails.value.subContractorMobile ?? '';
    subContractorNationalNumberController.text =
        installationDetails.value.subContractorNationalID ?? '';
    costController.text = installationDetails.value.cost != null
        ? installationDetails.value.cost.toString()
        : '';
    idController.text = installationDetails.value.insNumber ?? '';
    fromDateController.text = installationDetails.value.validFromDate != null
        ? DateFormat.yMd()
            .format(DateTime.parse(installationDetails.value.validFromDate!))
            .toString()
        : '';

    toDateController.text = installationDetails.value.validToDate != null
        ? DateFormat.yMd()
            .format(DateTime.parse(installationDetails.value.validToDate!))
            .toString()
        : '';
// subContractorCountryController.text = installationDetails.value. //country
    subContractorGovernController.text =
        installationDetails.value.subContractorGovernorateName ?? '';
    subContractorCityController.text =
        installationDetails.value.subContractorCityName ?? '';
    subContractorhasInsurenceController.text =
        installationDetails.value.hasInsurance != null
            ? installationDetails.value.hasInsurance!
                ? 'Yes'
                : 'No'
            : '';
    currencyNameController.text =
        installationDetails.value.costCurrencyName ?? '';
  }

  getRequestStatus() async {
    requestStatus.value = await InstallationsAPI.getRequestStatus();
  }

  @override
  void onInit() async {
    installation = Get.arguments['installation'];
    if (Get.arguments['toTab'] == 'toCustomer') {
      tabAppBarController.index.value = 5;
    }
    await getInstallationsDetails();
    await getRequestStatus();
    fillMainInfoInputs();
    fillProcesses();
    fillServices();
    fillComments();
    fillSubContractor();
    calcualteTotal();
    super.onInit();
  }
}
