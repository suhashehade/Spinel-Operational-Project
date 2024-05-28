import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/appbars/tabs_app_bar/tabs_app_bar.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/sidebar/custom_sidebar.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class InstallationDetailsScreen
    extends GetView<InstallationDetailsScreenController> {
  InstallationDetailsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Get.put(InstallationDetailsScreenController());
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(260),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.02,
            0.14,
            0.25,
            0.37,
            0.67,
            0.90,
            1.0,
          ],
              colors: [
            CustomColors.tuna,
            CustomColors.gravel,
            CustomColors.liver,
            CustomColors.darkTaupe,
            CustomColors.lion,
            CustomColors.chalky,
            CustomColors.lightTan,
          ])),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomColors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: CustomColors.transparent,
          leading: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: IconButton(
              icon: Assets.spinelLightLogo,
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: 5.0,
                width: 5.0,
                child: Assets.backIcon,
              ),
            ),
          ],
        ),
        drawer: const CustomSidebar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                      color: CustomColors.lightGrey,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      const TabsAppBar(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Obx(() => controller.isLoading.value
                          ? const CustomCircularProgressIndicator()
                          : Container(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 15, 15, 15),
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    PrefsService.to.getString(
                                                Consts.clientTokenKey) ==
                                            null
                                        ? Lists.installationDetailsTab[
                                            controller.tabAppBarController.index
                                                .value]
                                        : controller.tabAppBarController.index
                                                        .value !=
                                                    3 ||
                                                controller.tabAppBarController
                                                        .index.value !=
                                                    4
                                            ? Lists.installationDetailsTab[
                                                controller.tabAppBarController
                                                    .index.value]
                                            : null
                                  ],
                                ),
                              ),
                            ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
