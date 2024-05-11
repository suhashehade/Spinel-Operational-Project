import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/main_screen/controller/main_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class FilterDialog extends GetView<MainScreenController> {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: CustomColors.softPeach,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  controller.toggleStatusFilter();
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: CustomColors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Consts.orderStatus.tr),
                            controller.statusFilterIsOpened.value
                                ? const Icon(Icons.arrow_drop_up)
                                : const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        controller.statusFilterIsOpened.value
                            ? Column(
                                children: [
                                  ...Lists.orderStatus.map((s) => ListTile(
                                        title: Text(s.tr),
                                      )),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              Text(Consts.orderDate.tr),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.white,
                ),
                child: Row(
                  children: [
                    Text(Consts.from.tr),
                    CustomTextFormField(
                      heightRatio: 0.07,
                      borderColor: CustomColors.white,
                      widthRatio: 0.5,
                      fillColor: CustomColors.white,
                      maxLines: 1,
                      controller: controller.orderFromDateController,
                      textInputType: TextInputType.datetime,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: controller.pickDate,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.white,
                ),
                child: Row(
                  children: [
                    Text(Consts.to.tr),
                    CustomTextFormField(
                      heightRatio: 0.07,
                      borderColor: CustomColors.white,
                      widthRatio: 0.5,
                      fillColor: CustomColors.white,
                      maxLines: 1,
                      controller: controller.orderToDateController,
                      textInputType: TextInputType.datetime,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: controller.pickDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
