import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/buttons/navigate_button.dart';
import 'package:operations/common/custom_linear_percent_indicator.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/screens/operating/controller/operating_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class OperatingCard extends GetView<OperatingScreenController> {
  OperatingCard({super.key, required this.operating});
  late Operating operating;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleOpenInstallationCard(operating);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.whiteTransparent50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLinearPercentIndicator(
              percent: operating.totalProgress!.value,
              handle: () {},
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${Consts.id.tr}: '),
                          Text('${operating.id ?? ''}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.name.tr}: '),
                          Text(operating.clientName ?? ''),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.mobile.tr}: '),
                          Text(operating.mobile ?? ''),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.buildingAddress.tr}: '),
                          Text(operating.fullAddress ?? ''),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${Consts.date.tr}: '),
                          operating.requestDate != null
                              ? Text(DateFormat.yMd().format(
                                  DateTime.parse(operating.requestDate!)))
                              : const SizedBox(
                                  width: 100.0,
                                ),
                        ],
                      ),
                      Text(
                          '${Consts.govern.tr}: ${operating.governateName ?? ''}'),
                      Text('${Consts.city.tr}: ${operating.cityName ?? ''}'),
                    ],
                  )
                ],
              ),
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Center(
                    child: SizedBox(
                      height: 13.0,
                      width: 13.0,
                      child: operating.isOpened.value
                          ? Assets.upwardIcon
                          : Assets.downwardIcon,
                    ),
                  ),
                )),
            Obx(() => operating.isOpened.value
                ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.details.tr,
                          handle: controller.toOperatingDetails,
                          arguments: operating,
                        ),
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.stages.tr,
                          handle: controller.showProcessesDialog,
                          arguments: operating,
                        ),
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.map.tr,
                          handle: () {},
                          arguments: operating,
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
