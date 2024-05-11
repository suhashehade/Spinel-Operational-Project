import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/screens/main_screen/controller/main_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';
import 'package:operations/utils/routes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends GetView<MainScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.showFilterDialog();
              },
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                    color: CustomColors.lightYellow,
                    borderRadius: BorderRadius.all(Radius.circular(3.0))),
                child: Assets.filterIcon,
              ),
            ),
            CustomSearchBar(
              widthRatio: 0.77,
              fontColor: CustomColors.white,
              fillColor: CustomColors.transparent,
              controller: controller.searchcontroller,
              textInputType: TextInputType.text,
              labelText: Consts.search,
              obscureText: false,
              validator: () {},
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
            height: MediaQuery.of(context).size.height * 0.68,
            decoration: BoxDecoration(
                color: CustomColors.lightGrey,
                borderRadius: BorderRadius.circular(20.0)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Consts.customerName.tr),
                        Text(Consts.orderDate.tr),
                        Text(Consts.orderStatus.tr),
                      ],
                    ),
                  ),
                  ...Lists.orders.map(
                    (o) => InkWell(
                      onTap: () {
                        Get.toNamed(Routes.orderDetailsScreen,
                            arguments: {'order': o});
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: CustomColors.black,
                          ),
                          color: CustomColors.softPeach,
                        ),
                        child: Column(
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: CustomColors.softPeach,
                              progressColor: o.percent < 0.5
                                  ? CustomColors.lightRed
                                  : o.percent == 1.0
                                      ? CustomColors.lightGreen
                                      : CustomColors.lightYellow,
                              lineHeight:
                                  MediaQuery.of(context).size.height * 0.05,
                              percent: o.percent,
                              animation: true,
                              animationDuration: 500,
                              center: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(o.customerNameAr),
                                  Text(o.date),
                                  Text(o.status
                                      ? Consts.active.tr
                                      : Consts.notActive.tr),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              backgroundColor: CustomColors.softPeach,
                              progressColor: o.percent < 0.5
                                  ? CustomColors.red
                                  : o.percent == 1.0
                                      ? CustomColors.green
                                      : CustomColors.yellow,
                              lineHeight: 12,
                              percent: o.percent,
                              animation: true,
                              animationDuration: 500,
                              center: Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    '${o.percent * 100}%',
                                    style: const TextStyle(
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
