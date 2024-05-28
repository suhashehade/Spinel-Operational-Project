import 'package:get/get.dart';
import 'package:operations/common/dialogs/sub_contractor_order_details/sub_contractor_order_details.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/models/sub_contarctor/sub_contractor_order.dart';
import 'package:operations/services/api/installations_api.dart';

class SubContractorOrdersDialogController extends GetxController {
  late Installation installation;
  RxBool isLoading = false.obs;
  RxList<SubContractorOrder> subContractorOrders = <SubContractorOrder>[].obs;
  getSubContactorOrders() async {
    isLoading.value = true;
    subContractorOrders.value =
        await InstallationsAPI.getSubContactorOrders(installation);
    isLoading.value = false;
  }

  showSubContractorOrdersDetailsDialog(SubContractorOrder order) {
    Get.dialog(
      SubContarctorOrderDetailsDialog(),
      arguments: {'order': order},
    );
  }

  @override
  void onInit() async {
    installation = Get.arguments['installation'];
    await getSubContactorOrders();
    super.onInit();
  }
}
