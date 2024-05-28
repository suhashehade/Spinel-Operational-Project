// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/buttons/navigate_button.dart';
import 'package:operations/common/custom_linear_percent_indicator.dart';
import 'package:operations/common/process_card/process_card_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class ProcessCard extends GetView<ProcessCardController> {
  ProcessCard({super.key, required this.process});
  // ignore: prefer_typing_uninitialized_variables
  var process;

  @override
  Widget build(BuildContext context) {
    Get.put(ProcessCardController());
    return InkWell(
      onTap: () {
        controller.toggleOpenProcessCard(process);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.whiteTransparent30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLinearPercentIndicator(
              percent: process.progress.value ?? 0.0,
              handle: () {},
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    process.processName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${Consts.cost.tr}: ${process.totalOtherCost ?? ''} ${process.totalOtherCost != null ? '\$' : ''}'),
                      Row(
                        children: [
                          Text('${Consts.fromDate.tr}: '),
                          process.startDateTime != null
                              ? Text(DateFormat.yMd().format(
                                  DateTime.parse(process.startDateTime!)))
                              : const SizedBox(),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.toDate.tr}: '),
                          process.endDateTime != null
                              ? Text(DateFormat.yMd()
                                  .format(DateTime.parse(process.endDateTime!)))
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Obx(() => Center(
                  child: SizedBox(
                    height: 14,
                    width: 14,
                    child: process.isOpened.value
                        ? Assets.upwardIcon
                        : Assets.downwardIcon,
                  ),
                )),
            Obx(() => process.isOpened.value
                ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.details.tr,
                          handle: controller.showDetailsDialog,
                          arguments: process,
                        ),
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.addCost.tr,
                          handle: controller.showOtherCostsDialog,
                          arguments: process,
                        ),
                      ],
                    ),
                  )
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
