import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/dialogs/sub_contractor_orders_dialog/sub_contractor_orders_dialog_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';

class SubContractorOrdersDialog
    extends GetView<SubContractorOrdersDialogController> {
  const SubContractorOrdersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubContractorOrdersDialogController());
    return Dialog(
      backgroundColor: CustomColors.white,
      child: Container(
          padding: const EdgeInsets.all(30.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.white,
          ),
          child: Obx(
            () => controller.isLoading.value
                ? const CustomCircularProgressIndicator()
                : controller.subContractorOrders.isEmpty
                    ? const Center(
                        child: Text('No Orders'),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Amount'),
                            const SizedBox(
                              height: 10,
                            ),
                            ...controller.subContractorOrders.map((o) => Card(
                                  shadowColor: CustomColors.grey,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(o.amount!.toString()),
                                        InkWell(
                                          onTap: () {
                                            controller
                                                .showSubContractorOrdersDetailsDialog(
                                                    o);
                                          },
                                          child: SizedBox(
                                            height: 15.0,
                                            width: 15.0,
                                            child: Assets.detailsIcon,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
          )),
    );
  }
}
