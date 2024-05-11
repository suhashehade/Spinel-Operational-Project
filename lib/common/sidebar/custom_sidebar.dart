import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/common/sidebar/custom_sidebar_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class CustomSidebar extends GetView<CustomSideBarController> {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomSideBarController());
    return Drawer(
        width: 250.0,
        surfaceTintColor: CustomColors.softPeach,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: CustomColors.softPeach),
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.0,
                        width: 80.0,
                        child: Assets.spinelLogo,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CustomSearchBar(
                          widthRatio: 0.77,
                          fontColor: CustomColors.black,
                          fillColor: CustomColors.white,
                          controller: controller.searchController,
                          textInputType: TextInputType.text,
                          labelText: Consts.search,
                          obscureText: false,
                          validator: () {},
                          onTap: () {}),
                    ],
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Assets.homeIcon,
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.dashboard.tr,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Assets.revenueIcon,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.revenue.tr,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Assets.notificationsIcon,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.notifications.tr,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Assets.analyzeIcon,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.analyze.tr,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Assets.storeIcon,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.storage.tr,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
