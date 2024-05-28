import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class SubContractorTab extends GetView<InstallationDetailsScreenController> {
  const SubContractorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Consts.subcontractor.tr,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Consts.subcontractor.tr,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      readOnly: true,
                      textAlign: TextAlign.end,
                      textColor: CustomColors.black,
                      heightRatio: 0.07,
                      borderColor: CustomColors.white,
                      widthRatio: 0.9,
                      fillColor: CustomColors.white,
                      maxLines: 1,
                      controller: controller.subContractorNameController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Consts.phone.tr,
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
                      controller: controller.subContractorPhoneController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Consts.mobile.tr,
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
                      controller: controller.subContractormobileController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Consts.nationalNumber.tr,
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
                          controller.subContractorNationalNumberController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Consts.cost.tr,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          readOnly: true,
                          textAlign: TextAlign.end,
                          textColor: CustomColors.black,
                          heightRatio: 0.07,
                          borderColor: CustomColors.white,
                          widthRatio: 0.2,
                          fillColor: CustomColors.white,
                          maxLines: 1,
                          controller: controller.costController,
                          textInputType: TextInputType.number,
                          labelText: Consts.emptyString,
                          obscureText: false,
                          validator: controller.validator,
                          onTap: (context, controller) {},
                          onChanged: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: CustomTextFormField(
                    readOnly: true,
                    textAlign: TextAlign.end,
                    textColor: CustomColors.black,
                    heightRatio: 0.07,
                    borderColor: CustomColors.white,
                    widthRatio: 0.05,
                    fillColor: CustomColors.white,
                    maxLines: 1,
                    controller: controller.currencyNameController,
                    textInputType: TextInputType.number,
                    labelText: Consts.emptyString,
                    obscureText: false,
                    validator: controller.validator,
                    onTap: (context, controller) {},
                    onChanged: () {},
                  ),
                ),
              ],
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
                    Consts.subContractorCompany.tr,
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
                      controller: controller.subContractorCompanyController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                    Consts.id.tr,
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
                      controller: controller.idController,
                      textInputType: TextInputType.number,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                    Consts.fromDate.tr,
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
                      controller: controller.fromDateController,
                      textInputType: TextInputType.datetime,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: controller.pickDate,
                      onChanged: () {},
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
                    Consts.toDate.tr,
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
                      controller: controller.toDateController,
                      textInputType: TextInputType.datetime,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: controller.pickDate,
                      onChanged: () {},
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
                    Consts.country.tr,
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
                      controller: controller.subContractorCountryController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                    Consts.govern.tr,
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
                      controller: controller.subContractorGovernController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                      controller: controller.subContractorCityController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
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
                    Consts.haveInsurance.tr,
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
                          controller.subContractorhasInsurenceController,
                      textInputType: TextInputType.text,
                      labelText: Consts.emptyString,
                      obscureText: false,
                      validator: controller.validator,
                      onTap: (context, controller) {},
                      onChanged: () {},
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: controller.showSubContractorOrdersDialog,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Consts.subContractorOrders.tr),
                      Text(Consts.emptyString),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
