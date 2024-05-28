import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/appbars/tabs_app_bar/tabs_app_bar_controller.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class TabsAppBar extends GetView<TabsAppBarController> {
  const TabsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TabsAppBarController());
    return Container(
      // padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      color: CustomColors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: PrefsService.to.getString('currentView') == 'installation'
                ? PrefsService.to.getString(Consts.clientTokenKey) != null
                    ? [
                        ...Lists.tabsItems
                            .where((t) =>
                                t.index != 3 && t.index != 4 && t.index != 1)
                            .cast<Widget>()
                            .map((t) => t)
                      ]
                    : [...Lists.tabsItems.map((t) => t)]
                : [
                    ...Lists.tabsItems
                        .where((t) => t.index != 5)
                        .cast<Widget>()
                        .map((t) => t)
                  ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TabItem extends GetView<TabsAppBarController> {
  TabItem({super.key, required this.icon, required this.index});
  Image icon;
  int index;
  @override
  Widget build(BuildContext context) {
    Get.put(TabsAppBarController());
    return InkWell(
        onTap: () {
          controller.changeIndex(index);
        },
        child: Obx(
          () => Container(
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.1,
            color: index == controller.index.value
                ? CustomColors.yellowTransparent30
                : null,
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 20.0,
              width: 20.0,
              child: icon,
            ),
          ),
        ));
  }
}
