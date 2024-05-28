import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';

class DetailsTab extends GetView<InstallationDetailsScreenController> {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Consts.details.tr,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() => controller.services.isEmpty
            ? Center(
                child: Text(
                  Messages.emptyServicesList,
                  style: const TextStyle(
                    color: CustomColors.tuna,
                    fontSize: 14,
                  ),
                ),
              )
            : Column(
                children: [
                  ...controller.services.map(
                    (s) => Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.whiteTransparent50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${Consts.itemName.tr}: ${s.itemName ?? ''}'),
                          Text('${Consts.unit.tr}: ${s.unitName ?? ''}'),
                          Text('${Consts.quantity.tr}: ${s.quantity ?? ''}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
      ],
    );
  }
}
