// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/buttons/navigate_button.dart';
import 'package:operations/common/custom_linear_percent_indicator.dart';
import 'package:operations/common/operating_client_process_card%20copy/operating_client_process_card_controller.dart';
import 'package:operations/models/operating/operating_client_process.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class OperaingProcessClientCard extends GetView<OperatingProcessClientCardController> {
  OperaingProcessClientCard({super.key, required this.process});
  OperatingClientProcess process;

  @override
  Widget build(BuildContext context) {
    Get.put(OperatingProcessClientCardController());
    return InkWell(
        onTap: () {
          controller.toggleOpenProcessCard(process);
        },
        child: Obx(
          () => Container(
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
                  percent: process.progress!.value,
                  handle: () {},
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(process.processName ?? ''),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${Consts.admin.tr}: ${process.supervisorNameEn ?? ''}'),
                            Row(
                              children: [
                                Text('${Consts.fromDate.tr}: '),
                                process.endDateTime != null
                                    ? Text(DateFormat.yMd().format(
                                        DateTime.parse(process.startDateTime!)))
                                    : const SizedBox(),
                              ],
                            ),
                            Row(
                              children: [
                                Text('${Consts.toDate.tr}: '),
                                process.endDateTime != null
                                    ? Text(DateFormat.yMd().format(
                                        DateTime.parse(process.endDateTime!)))
                                    : const SizedBox(),
                              ],
                            ),
                          ])
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NavigateButton(
                              title: Consts.details.tr,
                              handle: controller.showDetailsDialog,
                              arguments: process,
                              widthRatio: 0.7,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox())
              ],
            ),
          ),
        ));
  }
}
