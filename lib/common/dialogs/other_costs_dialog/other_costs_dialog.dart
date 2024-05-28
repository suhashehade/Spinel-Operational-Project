import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/dialogs/other_costs_dialog/other_costs_dialog_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class OtherCostsDialog extends GetView<OtherCostsDialogController> {
  const OtherCostsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtherCostsDialogController());
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CustomColors.softPeach,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(Consts.otherCosts.tr),
                InkWell(
                  onTap: () {
                    controller.showAddOtherCost();
                  },
                  child: SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: Assets.addCostIcon,
                  ),
                )
              ],
            ),
            Obx(() => controller.isLoading.value
                ? const CustomCircularProgressIndicator()
                : controller.otherCosts.isEmpty
                    ? const Center(
                        child: Text('No data here'),
                      )
                    : Column(
                        children: [
                          ...controller.otherCosts.map((c) => Container(
                                padding: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width * 0.80,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${c.amount}'),
                                    Text(c.description ?? ''),
                                  ],
                                ),
                              ))
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}
