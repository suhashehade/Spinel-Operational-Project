import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.onTap,
    required this.onChange,
    required this.fillColor,
    required this.fontColor,
    required this.widthRatio,
    required this.borderColor,
  });
  late TextEditingController controller;

  late Function validator;
  late Function onTap;
  late Function onChange;
  late bool obscureText;
  late TextInputType textInputType;
  late String labelText;
  late Color fillColor;
  late Color fontColor;
  late Color borderColor;
  late double widthRatio;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.066,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: borderColor,
            width: 0.5,
          )),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * widthRatio,
            child: TextFormField(
              controller: controller,
              validator: (value) => validator(value),
              onTap: () => onTap(),
              onChanged: (value) => onChange(value),
              obscureText: obscureText,
              keyboardType: textInputType,
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
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
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: CustomColors.transparent,
                    width: 0.0,
                  ),
                ),
                hintText: labelText.tr,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
            width: 15.0,
            child: Assets.searchIcon,
          ),
        ],
      ),
    );
  }
}
