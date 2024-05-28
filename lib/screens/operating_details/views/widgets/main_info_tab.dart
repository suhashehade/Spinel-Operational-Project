import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/operating_details/controller/operating_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class OperatingMainInfoTab extends GetView<OperatingDetailsScreenController> {
  OperatingMainInfoTab({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.transparent,
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.toggleStatusFilter();
              },
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                          Text(Consts.orderStatus.tr),
                          Row(
                            children: [
                              CustomTextFormField(
                                readOnly: true,
                                maxLines: 1,
                                controller: controller.orderStatusController,
                                textInputType: TextInputType.text,
                                labelText: '',
                                obscureText: false,
                                validator: () {},
                                onTap: (context, controller) {},
                                onChanged: (value) {},
                                fillColor: CustomColors.transparent,
                                widthRatio: 0.4,
                                heightRatio: 0.06,
                                borderColor: CustomColors.transparent,
                                textColor: CustomColors.black,
                                textAlign: TextAlign.start,
                              ),
                              controller.statusFilterIsOpened.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          )
                        ],
                      ),
                      controller.statusFilterIsOpened.value
                          ? Column(
                              children: [
                                ...controller.requestStatus.map((s) => InkWell(
                                      onTap: () {
                                        controller.toggleStatusFilter();
                                      },
                                      child: ListTile(
                                        title: Text(
                                          s.labelAr.tr,
                                          style: const TextStyle(fontSize: 14),
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
              onTap: controller.toggleCustomerInfoShow,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.white,
                ),
                child: Center(
                  child: Text(
                    Consts.customerInfo.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Obx(() => AnimatedSlide(
                  offset: controller.isCustomerInfoShowed.value
                      ? const Offset(0, 0)
                      : const Offset(0, -0.1),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    height: !controller.isCustomerInfoShowed.value
                        ? MediaQuery.of(context).size.height * 0.0
                        : null,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.customerName.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller: controller.clientNameController,
                                  textInputType: TextInputType.text,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.city.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller: controller.clientCityController,
                                  textInputType: TextInputType.text,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.buildingAddress.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller:
                                      controller.clientAddressController,
                                  textInputType: TextInputType.text,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            InkWell(
              onTap: controller.toggleBuildingInfoShow,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.white,
                ),
                child: Center(
                  child: Text(
                    Consts.buildingInfo.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Obx(() => AnimatedSlide(
                  offset: controller.isBuildingInfoShowed.value
                      ? const Offset(0, 0)
                      : const Offset(0, -0.1),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    height: !controller.isBuildingInfoShowed.value
                        ? MediaQuery.of(context).size.height * 0.0
                        : null,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.buildingName.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller: controller.buildingNameController,
                                  textInputType: TextInputType.text,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.floor.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller: controller.floorController,
                                  textInputType: TextInputType.number,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                Consts.salesman.tr,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  textColor: CustomColors.black,
                                  heightRatio: 0.07,
                                  borderColor: CustomColors.white,
                                  widthRatio: 0.5,
                                  fillColor: CustomColors.white,
                                  maxLines: 1,
                                  controller: controller.salesManController,
                                  textInputType: TextInputType.text,
                                  labelText: Consts.emptyString,
                                  obscureText: false,
                                  validator: controller.validator,
                                  onTap: (context, controller) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            InkWell(
              onTap: () {
                controller.expandNotes();
              },
              child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        Text(Consts.notes.tr),
                        controller.isNotesExpanded.value
                            ? CustomTextFormField(
                                readOnly: false,
                                textAlign: TextAlign.start,
                                textColor: CustomColors.black,
                                heightRatio: 0.1,
                                maxLines: 10,
                                controller: controller.notesController,
                                textInputType: TextInputType.text,
                                labelText: Consts.emptyString,
                                obscureText: false,
                                validator: controller.validator,
                                onTap: (context, controller) {},
                                onChanged: (value) {},
                                fillColor: CustomColors.white,
                                widthRatio: 1,
                                borderColor: CustomColors.white,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SubmitButton(
              title: Consts.save.tr,
              formKey: _keyForm,
              handle: () {},
            ),
          ],
        ),
      ),
    );
  }
}
