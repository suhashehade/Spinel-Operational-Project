import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/dialogs/operating_processes_dialog/operating_processes_dialog_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class OperatingProcessesDialog
    extends GetView<OperatingProcessesDialogController> {
  const OperatingProcessesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OperatingProcessesDialogController());
    return Dialog(
        backgroundColor: CustomColors.white,
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: SingleChildScrollView(
              child: Obx(
                () => controller.isLoading.value
                    ? const CustomCircularProgressIndicator()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Column(
                              children: controller.processes.isEmpty
                                  ? [const Text('no processes')]
                                  : [
                                      ...controller.processes.map((p) =>
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: CustomColors.softPeach,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  LinearPercentIndicator(
                                                    isRTL: Get.deviceLocale!
                                                                .languageCode ==
                                                            'en'
                                                        ? false
                                                        : true,
                                                    backgroundColor:
                                                        CustomColors.softPeach,
                                                    progressColor: p.progress !=
                                                            null
                                                        ? p.progress!.value <
                                                                50.0
                                                            ? CustomColors
                                                                .lightRed
                                                            : p.progress!
                                                                        .value ==
                                                                    100.0
                                                                ? CustomColors
                                                                    .lightGreen
                                                                : CustomColors
                                                                    .lightYellow
                                                        : null,
                                                    lineHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    percent: p.progress != null
                                                        ? p.progress!.value /
                                                            100
                                                        : 0.0,
                                                    animation: true,
                                                    animationDuration: 500,
                                                    center: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .showDetailsDialog(
                                                                p);
                                                      },
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        0),
                                                                child: Text(
                                                                  p.processName!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                                )),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10,
                                                                      0,
                                                                      10,
                                                                      0),
                                                              height: 15.0,
                                                              width: 15.0,
                                                              child: Get.deviceLocale!
                                                                          .languageCode ==
                                                                      'en'
                                                                  ? Assets
                                                                      .forwardIcon
                                                                  : Assets
                                                                      .backIcon,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  LinearPercentIndicator(
                                                    isRTL: Get.deviceLocale!
                                                                .languageCode ==
                                                            'en'
                                                        ? false
                                                        : true,
                                                    backgroundColor:
                                                        CustomColors.softPeach,
                                                    progressColor: p.progress !=
                                                            null
                                                        ? (p.progress!.value <
                                                                50
                                                            ? CustomColors.red
                                                            : p.progress!
                                                                        .value ==
                                                                    100
                                                                ? CustomColors
                                                                    .green
                                                                : CustomColors
                                                                    .yellow)
                                                        : null,
                                                    lineHeight: 12,
                                                    percent: p.progress != null
                                                        ? p.progress!.value /
                                                            100
                                                        : 0.0,
                                                    animation: true,
                                                    animationDuration: 500,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ])
                        ],
                      ),
              ),
            ),
          )
        ])));
  }
}
