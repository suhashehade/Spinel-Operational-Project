import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/models/sub_contarctor/sub_contractor_order.dart';
import 'package:operations/models/sub_contarctor/sub_contractor_order_details.dart';
import 'package:operations/services/api/installations_api.dart';
import 'package:operations/utils/messages.dart';

class SubContractorOrdersDetailsDialogController extends GetxController {
  late SubContractorOrder order;
  RxBool isLoading = false.obs;
  Rx<SubContractorOrderDetails> orderDetails = SubContractorOrderDetails(
    0,
    '',
    0.0,
    '',
  ).obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  validator(value) {
    if (value == null || value.isEmpty) {
      return Messages.fillInputs.tr;
    }
    return null;
  }

  editSubContractorOrder() async {
    SubContractorOrderDetails details = SubContractorOrderDetails(
      orderDetails.value.detailsID,
      descriptionController.text,
      double.parse(amountController.text),
      noteController.text,
    );
    await InstallationsAPI.editSubContractorOrderDetails(details);
    Get.back();
  }

  getSubContactorOrderDetails() async {
    isLoading.value = true;
    orderDetails.value =
        await InstallationsAPI.getSubContactorOrderDetails(order);
    isLoading.value = false;
  }

  fillInputs() {
    amountController.text = orderDetails.value.amount.toString();
    noteController.text = orderDetails.value.note!;
    descriptionController.text = orderDetails.value.description!;
  }

  @override
  void onInit() async {
    order = Get.arguments['order'];
    await getSubContactorOrderDetails();
    fillInputs();
    super.onInit();
  }
}
