import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:operations/common/buttons/navigate_button.dart';
import 'package:operations/common/custom_linear_percent_indicator.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/screens/installation/controller/installation_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class InstallationCard extends GetView<InstallationScreenController> {
  InstallationCard({super.key, required this.installation});
  late Installation installation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleOpenInstallationCard(installation);
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
              percent: installation.totalProgress!.value,
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
                          Text('${installation.id ?? ''}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.name.tr}: '),
                          Text(installation.clientName ?? ''),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.mobile.tr}: '),
                          Text(installation.mobile ?? ''),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${Consts.buildingAddress.tr}: '),
                          Text(installation.fullAddress ?? ''),
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
                          installation.requestDate != null
                              ? Text(DateFormat.yMd().format(
                                  DateTime.parse(installation.requestDate!)))
                              : const SizedBox(
                                  width: 100.0,
                                ),
                        ],
                      ),
                      Text(
                          '${Consts.govern.tr}: ${installation.governateName ?? ''}'),
                      Text('${Consts.city.tr}: ${installation.cityName ?? ''}'),
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
                      child: installation.isOpened.value
                          ? Assets.upwardIcon
                          : Assets.downwardIcon,
                    ),
                  ),
                )),
            Obx(() => installation.isOpened.value
                ? Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.details.tr,
                          handle: controller.toInstalaltionDetails,
                          arguments: installation,
                        ),
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.stages.tr,
                          handle: controller.showProcessesDialog,
                          arguments: installation,
                        ),
                        NavigateButton(
                          widthRatio: 0.25,
                          title: Consts.map.tr,
                          handle: () {},
                          arguments: installation,
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
