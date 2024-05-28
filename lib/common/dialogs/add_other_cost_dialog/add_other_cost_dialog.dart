import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/dialogs/add_other_cost_dialog/add_other_cost_dialog_controller.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class AddOtherCostDialog extends GetView<AddOtherCostDialogController> {
  AddOtherCostDialog({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(AddOtherCostDialogController());
    return Dialog(
      backgroundColor: CustomColors.softPeach,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.softPeach,
        ),
        child: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  onChanged: (value) {},
                  fillColor: CustomColors.white,
                  widthRatio: 0.5,
                  borderColor: CustomColors.white,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  readOnly: false,
                  textAlign: TextAlign.start,
                  textColor: CustomColors.black,
                  heightRatio: 0.20,
                  maxLines: 10,
                  controller: controller.descriptionController,
                  textInputType: TextInputType.text,
                  labelText: Consts.description,
                  obscureText: false,
                  validator: controller.validator,
                  onTap: (context, controller) {},
                  onChanged: (value) {},
                  fillColor: CustomColors.white,
                  widthRatio: 0.5,
                  borderColor: CustomColors.white,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SubmitButton(
                  title: Consts.save.tr,
                  handle: controller.addOtherCost,
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
