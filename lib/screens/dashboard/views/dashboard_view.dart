import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/sidebar/custom_sidebar.dart';
import 'package:operations/screens/dashboard/controller/dashboard_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  DashboardScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return !Get.isOpaqueRouteDefault;
      },
      child: Container(
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
          key: _scaffoldKey,
          backgroundColor: CustomColors.transparent,
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
          ),
          drawer: const CustomSidebar(),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: const Column(),
          ),
        ),
      ),
    );
  }
}
