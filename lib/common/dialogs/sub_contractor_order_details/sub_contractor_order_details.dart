import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/dialogs/sub_contractor_order_details/sub_contractor_order_details_contractor.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class SubContarctorOrderDetailsDialog
    extends GetView<SubContractorOrdersDetailsDialogController> {
  SubContarctorOrderDetailsDialog({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(SubContractorOrdersDetailsDialogController());
    return Dialog(
      backgroundColor: CustomColors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.softPeach,
        ),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Consts.amount.tr),
                      CustomTextFormField(
                        readOnly: false,
                        textAlign: TextAlign.start,
                        textColor: CustomColors.black,
                        heightRatio: 0.07,
                        maxLines: 1,
                        controller: controller.amountController,
                        textInputType: TextInputType.text,
                        labelText: Consts.amount,
                        obscureText: false,
                        validator: controller.validator,
                        onTap: (context, controller) {},
                        onChanged: () {},
                        fillColor: CustomColors.white,
                        widthRatio: 0.5,
                        borderColor: CustomColors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Consts.description.tr),
                      CustomTextFormField(
                        readOnly: false,
                        textAlign: TextAlign.start,
                        textColor: CustomColors.black,
                        heightRatio: 0.1,
                        maxLines: 5,
                        controller: controller.descriptionController,
                        textInputType: TextInputType.text,
                        labelText: Consts.description,
                        obscureText: false,
                        validator: controller.validator,
                        onTap: (context, controller) {},
                        onChanged: () {},
                        fillColor: CustomColors.white,
                        widthRatio: 0.5,
                        borderColor: CustomColors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: CustomColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Consts.notes.tr),
                      CustomTextFormField(
                        readOnly: false,
                        textAlign: TextAlign.start,
                        textColor: CustomColors.black,
                        heightRatio: 0.10,
                        maxLines: 5,
                        controller: controller.noteController,
                        textInputType: TextInputType.text,
                        labelText: Consts.note,
                        obscureText: false,
                        validator: controller.validator,
                        onTap: (context, controller) {},
                        onChanged: () {},
                        fillColor: CustomColors.white,
                        widthRatio: 0.5,
                        borderColor: CustomColors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SubmitButton(
                  title: Consts.edit.tr,
                  handle: controller.editSubContractorOrder,
                  formKey: _keyForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
