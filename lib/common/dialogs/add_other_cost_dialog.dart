import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/red_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/level_details_screen/controller/level_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class AddOtherCostDialog extends GetView<LevelDetailsScreenController> {
  const AddOtherCostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CustomTextFormField(
            heightRatio: 0.07,
            maxLines: 1,
            controller: controller.amountController,
            textInputType: TextInputType.text,
            labelText: Consts.amount,
            obscureText: false,
            validator: controller.validator,
            onTap: () {},
            fillColor: CustomColors.white,
            widthRatio: 0.5,
            borderColor: CustomColors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextFormField(
            heightRatio: 0.20,
            maxLines: 10,
            controller: controller.costNoteController,
            textInputType: TextInputType.text,
            labelText: Consts.note,
            obscureText: false,
            validator: controller.validator,
            onTap: () {},
            fillColor: CustomColors.white,
            widthRatio: 0.5,
            borderColor: CustomColors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          RedButton(title: Consts.save.tr, handle: () {}),
        ],
      ),
    );
  }
}
