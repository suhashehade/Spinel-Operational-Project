import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/screens/level_details_screen/controller/level_details_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class OtherCostsDialog extends GetView<LevelDetailsScreenController> {
  const OtherCostsDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                ...Lists.otherCosts.map((c) => Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${c.amount}'),
                          Text(c.note),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
