import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/dialogs/filter_dialog/filter_dialog_controller.dart';
import 'package:operations/common/text_fields/filter_text_field.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class FiltersDialog extends GetView<FiltersDialogController> {
  const FiltersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FiltersDialogController());
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: CustomColors.white,
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Column(
                children: [
                  Text(Consts.filter.tr),
                  const SizedBox(height: 30.0),
                  InkWell(
                      onTap: () {
                        controller.toggleDateFilterExpand();
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Consts.orderDate.toString().tr),
                                  controller.dateFilterIsExppanded.value
                                      ? CustomFilterTextField(
                                          filterKey: 'Date',
                                          readOnly: false,
                                          maxLines: 1,
                                          controller:
                                              controller.orderDateController,
                                          textInputType: TextInputType.datetime,
                                          labelText: Consts.emptyString,
                                          obscureText: false,
                                          validator: () {},
                                          onTap: controller.pickDate,
                                          onChanged: controller.filter,
                                          fillColor: CustomColors.softPeach,
                                          widthRatio: 0.35,
                                          heightRatio: 0.06,
                                          borderColor: CustomColors.softPeach,
                                          textColor: CustomColors.black,
                                          textAlign: TextAlign.start,
                                        )
                                      : const SizedBox()
                                ],
                              ),
                              controller.dateFilterIsExppanded.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        controller.toggleIdFilterExpand();
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Consts.id.toString().tr),
                                  controller.idFilterIsExppanded.value
                                      ? CustomFilterTextField(
                                          filterKey: 'Id',
                                          readOnly: false,
                                          maxLines: 1,
                                          controller: controller.idController,
                                          textInputType: TextInputType.number,
                                          labelText: Consts.emptyString,
                                          obscureText: false,
                                          validator: () {},
                                          onTap: (controller, context) {},
                                          onChanged: controller.filter,
                                          fillColor: CustomColors.softPeach,
                                          widthRatio: 0.35,
                                          heightRatio: 0.06,
                                          borderColor: CustomColors.softPeach,
                                          textColor: CustomColors.black,
                                          textAlign: TextAlign.start,
                                        )
                                      : const SizedBox()
                                ],
                              ),
                              controller.idFilterIsExppanded.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        controller.toggleCityFilterExpand();
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Consts.city.toString().tr),
                                  controller.cityFilterIsExppanded.value
                                      ? SizedBox(
                                          width: 130,
                                          height: 55,
                                          child: Obx(
                                            () => DropdownButtonFormField(
                                                isDense: true,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return controller
                                                      .validateCity(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                      borderSide: BorderSide()),
                                                ),
                                                hint: const Text(
                                                  'Select City',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                                items: [
                                                  DropdownMenuItem(
                                                      onTap: () {
                                                        controller.filter(
                                                            'CityId', '');
                                                        controller
                                                            .selectedCityId
                                                            .value = 0;
                                                      },
                                                      value: '',
                                                      child: const Text(
                                                        'Clear filter',
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      )),
                                                  ...controller.cites
                                                      .map<DropdownMenuItem>(
                                                          (value) {
                                                    return DropdownMenuItem(
                                                        onTap: () {
                                                          controller
                                                              .upadateSelectedCityId(
                                                                  value.value);
                                                        },
                                                        value: value.value,
                                                        child: Text(
                                                          value.labelAr,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      12.0),
                                                        ));
                                                  })
                                                ],
                                                onChanged: (value) {
                                                  controller.filter(
                                                      'CityId', value);
                                                },
                                                value: controller.selectedCityId
                                                            .value ==
                                                        0
                                                    ? null
                                                    : controller
                                                        .selectedCityId.value),
                                          ))
                                      : const SizedBox(),
                                ],
                              ),
                              controller.cityFilterIsExppanded.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        controller.toggleGovernFilterExpand();
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Consts.govern.toString().tr),
                                  controller.governFilterIsExppanded.value
                                      ? SizedBox(
                                          width: 130,
                                          height: 55,
                                          child: Obx(
                                            () => DropdownButtonFormField(
                                                isDense: true,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return controller
                                                      .validateGovern(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                      borderSide: BorderSide()),
                                                ),
                                                hint: const Text(
                                                  'Select Govern',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                                items: [
                                                  DropdownMenuItem(
                                                      onTap: () {
                                                        controller.filter(
                                                            'GovernateId', '');
                                                        controller
                                                            .selectedGovernId
                                                            .value = 0;
                                                      },
                                                      value: '',
                                                      child: const Text(
                                                        'clear filter',
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                        ),
                                                      )),
                                                  ...controller.governs
                                                      .map<DropdownMenuItem>(
                                                          (value) {
                                                    return DropdownMenuItem(
                                                        onTap: () {
                                                          controller
                                                              .upadateSelectedGovernId(
                                                                  value.value);
                                                        },
                                                        value: value.value,
                                                        child: Text(
                                                          value.labelAr,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      12.0),
                                                        ));
                                                  })
                                                ],
                                                onChanged: (value) {
                                                  controller.filter(
                                                      'GovernateId', value);
                                                },
                                                value: controller
                                                            .selectedGovernId
                                                            .value ==
                                                        0
                                                    ? null
                                                    : controller
                                                        .selectedGovernId
                                                        .value),
                                          ))
                                      : const SizedBox(),
                                ],
                              ),
                              controller.governFilterIsExppanded.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        controller.toggleClientFilterExpand();
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Consts.client.toString().tr),
                                  controller.clientFilterIsExppanded.value
                                      ? SizedBox(
                                          width: 130,
                                          height: 55,
                                          child: Obx(
                                            () => DropdownButtonFormField(
                                                isDense: true,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  return controller
                                                      .validateClient(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                      borderSide: BorderSide()),
                                                ),
                                                hint: const Text(
                                                  'Select Client',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                items: [
                                                  DropdownMenuItem(
                                                      onTap: () {
                                                        controller.filter(
                                                            'ClientID', '');
                                                        controller
                                                            .selectedClientId
                                                            .value = '';
                                                      },
                                                      value: '',
                                                      child: const Text(
                                                        'clear filter',
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      )),
                                                  ...controller.clients
                                                      .map<DropdownMenuItem>(
                                                          (value) {
                                                    return DropdownMenuItem(
                                                        onTap: () {
                                                          controller
                                                              .upadateSelectedClientId(
                                                                  value
                                                                      .clientNameID);
                                                        },
                                                        value:
                                                            value.clientNameID,
                                                        child: Text(
                                                          value.clientName ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      12.0),
                                                        ));
                                                  })
                                                ],
                                                onChanged: (value) {
                                                  controller.filter(
                                                      'ClientID', value);
                                                },
                                                value: controller
                                                            .selectedClientId
                                                            .value ==
                                                        ''
                                                    ? null
                                                    : controller
                                                        .selectedClientId
                                                        .value),
                                          ))
                                      : const SizedBox(),
                                ],
                              ),
                              controller.clientFilterIsExppanded.value
                                  ? const Icon(Icons.arrow_drop_up)
                                  : const Icon(Icons.arrow_drop_down),
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
    );
  }
}
