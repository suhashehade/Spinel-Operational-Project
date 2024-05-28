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
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/lkps/lkps.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/models/operating/operating_client_process.dart';
import 'package:operations/models/operating/operating_details.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/models/operating/operating_process_details_item.dart';
import 'package:operations/models/operating/operating_service.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/services/api/operating_api.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class OperatingDetailsScreenController extends GetxController {
  late Operating operating;
  RxDouble notesHeightRatio = 0.06.obs;
  RxBool statusFilterIsOpened = false.obs;
  RxBool isCustomerInfoShowed = false.obs;
  RxBool isBuildingInfoShowed = false.obs;
  RxBool isNotesExpanded = false.obs;
  int page = 1;
  int pageSize = 10;
  ScrollController scrollController = ScrollController();
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
  RxList<OperatingClientProcess> clientProcesses =
      <OperatingClientProcess>[].obs;
  RxList<OperatingService> services = <OperatingService>[].obs;
  RxList<Comment> comments = <Comment>[].obs;
  RxList<Lookups> requestStatus = <Lookups>[].obs;
  RxBool isOpened = false.obs;
  RxDouble totalCost = 0.0.obs;
  RxBool isLoading = false.obs;
  RxBool isCommnetsLoading = false.obs;
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

  toogleIsOpened(OperatingProcessDetailsItem item) {
    item.isOpened.value = !item.isOpened.value;
  }

  toggleCustomerInfoShow() {
    isCustomerInfoShowed.value = !isCustomerInfoShowed.value;
  }

  toggleBuildingInfoShow() {
    isBuildingInfoShowed.value = !isBuildingInfoShowed.value;
  }

  toggleOpenProcessCard(OperatingProcess process) {
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
      page = 1;
      pageSize = 10;
      await fillComments();
      isLoading.value = false;
    }
  }

  pickDate(context, controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1950), lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
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
      arguments: {'operating': operating},
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
          CommentBody(operating.id!, 2, chatController.text);
      await OperatingAPI.postComment(commentBody);
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
        await OperatingAPI.getOperationsOperatingProcesses(operating);
  }

  getOperatingDetails() async {
    isLoading.value = true;
    operatingDetails.value =
        await OperatingAPI.getOperationOperatingViewDetails(operating);
    isLoading.value = false;
  }

  fillMainInfoInputs() {
    clientNameController.text = operatingDetails.value.clientNameAr ?? '';
    clientCityController.text = operatingDetails.value.clientCityName ?? '';
    clientAddressController.text = operatingDetails.value.clientAddress ?? '';

    buildingNameController.text = operatingDetails.value.buildingName ?? '';
    floorController.text = operatingDetails.value.buildingFloor ?? '';
    salesManController.text = operatingDetails.value.salesManNameAr ?? '';
    notesController.text = operatingDetails.value.notes ?? '';
    orderStatusController.text = requestStatus[0].labelEn;
  }

  fillProcesses() async {
    await getProcesses();
  }

  fillServices() {
    services.value = operatingDetails.value.lstServices;
  }

  fillComments() async {
    comments.value = await OperatingAPI.getComments(operating.id!, 2);
  }

  fillSubContractor() {
    subContractorNameController.text =
        operatingDetails.value.subContractorAccNameAr ?? '';
    subContractorPhoneController.text =
        operatingDetails.value.subContractorPhone ?? '';
    subContractorCompanyController.text =
        operatingDetails.value.insCompany ?? '';
    subContractormobileController.text =
        operatingDetails.value.subContractorMobile ?? '';
    subContractorNationalNumberController.text =
        operatingDetails.value.subContractorNationalID ?? '';
    costController.text = operatingDetails.value.cost != null
        ? operatingDetails.value.cost.toString()
        : '';
    idController.text = operatingDetails.value.insNumber ?? '';
    fromDateController.text = operatingDetails.value.validFromDate != null
        ? DateFormat.yMd()
            .format(DateTime.parse(operatingDetails.value.validFromDate!))
            .toString()
        : '';

    toDateController.text = operatingDetails.value.validToDate != null
        ? DateFormat.yMd()
            .format(DateTime.parse(operatingDetails.value.validToDate!))
            .toString()
        : '';
// subContractorCountryController.text = installationDetails.value. //country
    subContractorGovernController.text =
        operatingDetails.value.subContractorGovernorateName ?? '';
    subContractorCityController.text =
        operatingDetails.value.subContractorCityName ?? '';
    subContractorhasInsurenceController.text =
        operatingDetails.value.hasInsurance != null
            ? operatingDetails.value.hasInsurance!
                ? 'Yes'
                : 'No'
            : '';
    currencyNameController.text = operatingDetails.value.costCurrencyName ?? '';
  }

  getRequestStatus() async {
    requestStatus.value = await InstallationsAPI.getRequestStatus();
  }

  @override
  void onInit() async {
    operating = Get.arguments['operating'];
    if (Get.arguments['toTab'] == 'toCustomer') {
      tabAppBarController.index.value = 5;
    }
    await getOperatingDetails();
    await getRequestStatus();
    fillMainInfoInputs();
    fillProcesses();
    fillServices();
    fillComments();
    // fillSubContractor();
    // calcualteTotal();

    super.onInit();
  }
}
