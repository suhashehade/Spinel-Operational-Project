import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/screens/level_details/controller/level_details_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class CommentField extends GetView<LevelDetailsScreenController> {
  CommentField({
    super.key,
    required this.maxLines,
    required this.chatController,
    required this.textInputType,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.onTap,
    required this.fillColor,
    required this.widthRatio,
    required this.heightRatio,
    required this.borderColor,
    required this.onSubmit,
  });

  late TextEditingController chatController;
  late int maxLines;
  late Function validator;
  late Function onTap;
  late bool obscureText;
  late TextInputType textInputType;
  late String labelText;
  late Color fillColor;
  late double widthRatio;
  late double heightRatio;
  late Color borderColor;
  late Function onSubmit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: fillColor,
      ),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * heightRatio,
            width: MediaQuery.of(context).size.width * widthRatio,
            child: TextFormField(
              controller: chatController,
              maxLines: maxLines,
              validator: (value) => validator(value),
              obscureText: obscureText,
              keyboardType: textInputType,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: CustomColors.transparent,
                    width: 0.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: CustomColors.transparent,
                    width: 0.0,
                  ),
                ),
                hintStyle: const TextStyle(fontSize: 14.0),
                hintText: labelText.tr,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onSubmit();
            },
            child: SizedBox(
              height: 15.0,
              width: 15.0,
              child: Assets.sendIcon,
            ),
          )
        ],
      ),
    );
  }
}
