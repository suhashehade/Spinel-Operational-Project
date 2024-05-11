import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/bottombar/custom_bottombar.dart';
import 'package:operations/common/sidebar/custom_sidebar.dart';
import 'package:operations/screens/main_screen/controller/main_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return !Get.isOpaqueRouteDefault;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            Consts.projectName.tr,
            style: const TextStyle(color: CustomColors.white),
          ),
          backgroundColor: CustomColors.pacificBlue,
          leading: IconButton(
            icon: Assets.spinelLogo,
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: const CustomSidebar(),
        body: SingleChildScrollView(
          child: Obx(
            () => Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: const BoxDecoration(color: CustomColors.pacificBlue),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Lists.mainPageScreens[
                      controller.customBottomBarController.index.value],
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
