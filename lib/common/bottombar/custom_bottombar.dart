import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/bottombar/custom_bottombar_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/routes.dart';

class CustomBottomBar extends GetView<CustomBottomBarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottomBarController());
    return Obx(() => Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          color: CustomColors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              selectedItemColor: CustomColors.black,
              unselectedItemColor: CustomColors.grey,
              showUnselectedLabels: true,
              enableFeedback: false,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(fontSize: 10.0),
              unselectedLabelStyle: const TextStyle(fontSize: 10.0),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: Consts.home.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.line_axis_rounded,
                  ),
                  label: Consts.levels.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.edit_note,
                  ),
                  label: Consts.editInfo.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.search_rounded,
                  ),
                  label: Consts.details.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                  ),
                  label: Consts.account.tr,
                ),
              ],
              onTap: (index) {
                Get.offNamedUntil(Routes.mainScreen, (route) => true);
                controller.changeIndex(index);
              },
            ),
          ),
        ));
  }
}
