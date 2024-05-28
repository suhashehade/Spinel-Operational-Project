import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/custom_linear_percent_indicator.dart';
import 'package:operations/common/dialogs/process_details_dialog/process_details_dialog_controller.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class ProcessDetailsDialog extends GetView<ProcessDetailsDialogController> {
  const ProcessDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProcessDetailsDialogController());

    return BottomSheet(
      builder: (context) {
        return Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => CustomLinearPercentIndicator(
                      percent: controller.progress.value,
                      handle: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: SingleChildScrollView(
                          child: Obx(() => controller.isLoading.value
                              ? const CustomCircularProgressIndicator()
                              : Column(
                                  children:
                                      Get.arguments['type'] == 'installation'
                                          ? [
                                              ...controller.processDetailsItems
                                                  .map((i) => Obx(
                                                        () => InkWell(
                                                          enableFeedback: false,
                                                          onTap: () {
                                                            controller
                                                                .toogleIsOpened(
                                                                    i);
                                                          },
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(0,
                                                                    0, 0, 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              color:
                                                                  CustomColors
                                                                      .white,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    i.checkName ??
                                                                        ''),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    i.isOpened
                                                                            .value
                                                                        ? const Icon(Icons
                                                                            .arrow_drop_up)
                                                                        : const Icon(
                                                                            Icons.arrow_drop_down),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsConfirmed(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isConfirm.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.confirm.tr,
                                                                            style:
                                                                                TextStyle(
                                                                              color: i.isConfirm.value ? CustomColors.white : CustomColors.tuna,
                                                                            ),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsSkipped(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isSkipped.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.skipped.tr,
                                                                            style:
                                                                                TextStyle(color: i.isSkipped.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsYes(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isYes.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.yes.tr,
                                                                            style:
                                                                                TextStyle(color: i.isYes.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsNo(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isNo.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.no.tr,
                                                                            style:
                                                                                TextStyle(color: i.isNo.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                i.isOpened
                                                                        .value
                                                                    ? CustomTextFormField(
                                                                        readOnly:
                                                                            false,
                                                                        textAlign: TextAlign
                                                                            .start,
                                                                        textColor: CustomColors
                                                                            .black,
                                                                        heightRatio:
                                                                            0.07,
                                                                        borderColor: CustomColors
                                                                            .black,
                                                                        maxLines:
                                                                            1,
                                                                        controller: i
                                                                            .controller,
                                                                        textInputType: TextInputType
                                                                            .text,
                                                                        labelText:
                                                                            Consts
                                                                                .notes,
                                                                        obscureText:
                                                                            false,
                                                                        validator:
                                                                            controller
                                                                                .validator,
                                                                        onTap:
                                                                            (context,
                                                                                controller) {},
                                                                        onChanged:
                                                                            () {},
                                                                        fillColor:
                                                                            CustomColors
                                                                                .transparent,
                                                                        widthRatio:
                                                                            0.8)
                                                                    : const SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                            ]
                                          : [
                                              ...controller
                                                  .operatingProcessDetailsItems
                                                  .map((i) => Obx(
                                                        () => InkWell(
                                                          enableFeedback: false,
                                                          onTap: () {
                                                            controller
                                                                .toogleIsOpened(
                                                                    i);
                                                          },
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(0,
                                                                    0, 0, 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              color:
                                                                  CustomColors
                                                                      .white,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                    i.checkName ??
                                                                        ''),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    i.isOpened
                                                                            .value
                                                                        ? const Icon(Icons
                                                                            .arrow_drop_up)
                                                                        : const Icon(
                                                                            Icons.arrow_drop_down),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsConfirmed(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isConfirm.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.confirm.tr,
                                                                            style:
                                                                                TextStyle(
                                                                              color: i.isConfirm.value ? CustomColors.white : CustomColors.tuna,
                                                                            ),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsSkipped(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isSkipped.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.skipped.tr,
                                                                            style:
                                                                                TextStyle(color: i.isSkipped.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsYes(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isYes.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.yes.tr,
                                                                            style:
                                                                                TextStyle(color: i.isYes.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .toggleIsNo(i);
                                                                      },
                                                                      child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            color: i.isNo.value
                                                                                ? CustomColors.tuna
                                                                                : null,
                                                                          ),
                                                                          padding: const EdgeInsets.all(3.0),
                                                                          child: Text(
                                                                            Consts.no.tr,
                                                                            style:
                                                                                TextStyle(color: i.isNo.value ? CustomColors.white : CustomColors.tuna),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                i.isOpened
                                                                        .value
                                                                    ? CustomTextFormField(
                                                                        readOnly:
                                                                            false,
                                                                        textAlign: TextAlign
                                                                            .start,
                                                                        textColor: CustomColors
                                                                            .black,
                                                                        heightRatio:
                                                                            0.07,
                                                                        borderColor: CustomColors
                                                                            .black,
                                                                        maxLines:
                                                                            1,
                                                                        controller: i
                                                                            .controller,
                                                                        textInputType: TextInputType
                                                                            .text,
                                                                        labelText:
                                                                            Consts
                                                                                .notes,
                                                                        obscureText:
                                                                            false,
                                                                        validator:
                                                                            controller
                                                                                .validator,
                                                                        onTap:
                                                                            (context,
                                                                                controller) {},
                                                                        onChanged:
                                                                            () {},
                                                                        fillColor:
                                                                            CustomColors
                                                                                .transparent,
                                                                        widthRatio:
                                                                            0.8)
                                                                    : const SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                            ],
                                ))))
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: Get.arguments['type'] == 'operating' &&
                        Get.arguments['loginType'] == 'Client'
                    ? null
                    : FloatingActionButton(
                        shape: const CircleBorder(eccentricity: 0.5),
                        backgroundColor: CustomColors.lightTan,
                        onPressed: () {
                          controller.save();
                        },
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Assets.saveIcon,
                        ),
                      ),
              )),
        ]);
      },
      onClosing: () {},
    );
  }
}
