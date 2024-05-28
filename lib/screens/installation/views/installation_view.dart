import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/dialogs/filter_dialog/filter_dialog.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/common/sidebar/custom_sidebar.dart';
import 'package:operations/screens/installation/controller/installation_screen_controller.dart';
import 'package:operations/screens/installation/views/widgets/installation_card.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class InstallationScreen extends GetView<InstallationScreenController> {
  InstallationScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      // ignore: deprecated_member_use
      child: WillPopScope(
        onWillPop: () async {
          return !Get.isOpaqueRouteDefault;
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColors.transparent,
          appBar: AppBar(
            backgroundColor: CustomColors.transparent,
            actionsIconTheme: const IconThemeData(opacity: 0),
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
          endDrawer: const FiltersDialog(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomSearchBar(
                          borderColor: CustomColors.black,
                          widthRatio: 0.70,
                          fontColor: CustomColors.black,
                          fillColor: CustomColors.transparent,
                          controller: controller.searchcontroller,
                          textInputType: TextInputType.text,
                          labelText: Consts.search,
                          obscureText: false,
                          validator: () {},
                          onTap: () {},
                          onChange: controller.search,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                              color: CustomColors.tuna,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Assets.filterIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: Obx(
                      () => controller.installations.isEmpty &&
                              !controller.isLoading.value
                          ? const Center(
                              child: Text('No Data Here'),
                            )
                          : ListView.builder(
                              controller: controller.scrollController,
                              itemCount: controller.installations.length +
                                  (controller.isLoading.value ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index < controller.installations.length) {
                                  return InstallationCard(
                                    installation:
                                        controller.installations[index],
                                  );
                                } else {
                                  return const Center(
                                    child: CustomCircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
