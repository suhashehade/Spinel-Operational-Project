import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logos/spinel_dark_logo_widget.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/common/sidebar/custom_sidebar_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class CustomSidebar extends GetView<CustomSideBarController> {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomSideBarController());
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: CustomColors.softPeach,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Obx(
            () => Column(
              children: <Widget>[
                DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpinelDarkLogoWidget(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomSearchBar(
                        borderColor: CustomColors.black,
                        widthRatio: 0.40,
                        fontColor: CustomColors.black,
                        fillColor: CustomColors.transparent,
                        controller: controller.searchController,
                        textInputType: TextInputType.text,
                        labelText: Consts.search,
                        obscureText: false,
                        validator: () {},
                        onTap: (context, controller) {},
                        onChange: () {},
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {
                      controller.toDashboard();
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Assets.dashboardIcon,
                        ),
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
                InkWell(
                  onTap: () {
                    controller.toggleSales();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Assets.salesIcon,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(Consts.sales.tr),
                                ],
                              ),
                              controller.isSalesOpend.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          controller.isSalesOpend.value
                              ? Column(
                                  children: [
                                    ...Lists.sales.map((s) => ListTile(
                                          title: Text(
                                            s.tr,
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                          ),
                                        )),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.toggleOperations();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Assets.operationsIcon,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(Consts.operations.tr),
                                ],
                              ),
                              controller.isOperationsOpend.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          controller.isOperationsOpend.value
                              ? Column(
                                  children: [
                                    ...Lists.operations.map((o) => InkWell(
                                          onTap: () {
                                            o == 'operating'
                                                ? controller.toOperating()
                                                : controller.toInstallation();
                                          },
                                          child: ListTile(
                                            title: Text(
                                              o.tr,
                                              style: const TextStyle(
                                                  fontSize: 12.0),
                                            ),
                                          ),
                                        )),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.toggleMaintenance();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Assets.maintenanceIcon,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(Consts.maintenance.tr),
                                ],
                              ),
                              controller.isMaintenaceOpend.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          controller.isMaintenaceOpend.value
                              ? Column(
                                  children: [
                                    ...Lists.maintenance.map((m) => ListTile(
                                          title: Text(
                                            m.tr,
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                          ),
                                        )),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.toggleHr();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Assets.hrIcon,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(Consts.hr.tr),
                                ],
                              ),
                              controller.isHrOpend.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          controller.isHrOpend.value
                              ? Column(
                                  children: [
                                    ...Lists.hr.map((h) => ListTile(
                                          title: Text(
                                            h.tr,
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                          ),
                                        )),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: InkWell(
                    onTap: () {
                      controller.logout();
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Icon(Icons.logout),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          Consts.logout.tr,
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
          )),
        ));
  }
}
