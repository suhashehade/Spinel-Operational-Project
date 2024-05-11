import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/models/level/level.dart';
import 'package:operations/screens/level_details_screen/controller/level_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class LevelDetailsDialog extends GetWidget<LevelDetailsScreenController> {
  LevelDetailsDialog({super.key, required this.level});
  Level level;
  @override
  Widget build(BuildContext context) {
    Get.create(() => LevelDetailsScreenController());
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: CustomColors.black,
                  ),
                  color: CustomColors.softPeach,
                ),
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      backgroundColor: CustomColors.softPeach,
                      progressColor: level.percent < 0.5
                          ? CustomColors.lightRed
                          : level.percent == 1.0
                              ? CustomColors.lightGreen
                              : CustomColors.lightYellow,
                      lineHeight: MediaQuery.of(context).size.height * 0.05,
                      percent: level.percent,
                      animation: true,
                      animationDuration: 500,
                    ),
                    LinearPercentIndicator(
                      backgroundColor: CustomColors.softPeach,
                      progressColor: level.percent < 0.5
                          ? CustomColors.red
                          : level.percent == 1.0
                              ? CustomColors.lightGreen
                              : CustomColors.lightYellow,
                      lineHeight: 12,
                      percent: level.percent,
                      animation: true,
                      animationDuration: 500,
                      center: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            '${level.percent * 100}%',
                            style: const TextStyle(
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Text(Consts.back.tr),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(Consts.save.tr),
                    ),
                  ],
                ),
              ),
              ...Lists.levelDetailsItems.map((i) => Obx(
                    () => InkWell(
                      enableFeedback: false,
                      onTap: () {
                        controller.toogleIsOpened(i);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomColors.white,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            i.isOpened.value
                                ? const Icon(Icons.arrow_drop_up)
                                : const Icon(Icons.arrow_drop_down),
                            Column(
                              children: [
                                Text(i.title),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Consts.confirm.tr),
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: CustomColors.red,
                                          ),
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(Consts.skipped.tr)),
                                      Text(Consts.no.tr),
                                      Text(Consts.yes.tr),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                i.isOpened.value
                                    ? Row(
                                        children: [
                                          CustomTextFormField(
                                              heightRatio: 0.07,
                                              borderColor: CustomColors.black,
                                              maxLines: 1,
                                              controller: i.controller,
                                              textInputType: TextInputType.text,
                                              labelText: Consts.notes,
                                              obscureText: false,
                                              validator: controller.validator,
                                              onTap: () {},
                                              fillColor:
                                                  CustomColors.transparent,
                                              widthRatio: 0.55),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
