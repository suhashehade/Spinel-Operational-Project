import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class CustomFilterTextField extends StatelessWidget {
  late TextEditingController controller;
  late int maxLines;
  late Function validator;
  late Function onTap;
  late Function onChanged;
  late bool obscureText;
  late TextInputType textInputType;
  late String labelText;
  late Color fillColor;
  late double widthRatio;
  late double heightRatio;
  late Color borderColor;
  late Color textColor;
  late TextAlign textAlign;
  late bool readOnly;
  late String filterKey;
  CustomFilterTextField({
    super.key,
    required this.maxLines,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.onTap,
    required this.onChanged,
    required this.fillColor,
    required this.widthRatio,
    required this.heightRatio,
    required this.borderColor,
    required this.textColor,
    required this.textAlign,
    required this.readOnly,
    required this.filterKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightRatio,
      width: MediaQuery.of(context).size.width * widthRatio,
      child: TextFormField(
        textAlign: textAlign,
        style: TextStyle(color: textColor, fontSize: 12),
        cursorColor: CustomColors.lightTan,
        cursorErrorColor: CustomColors.lightTan,
        controller: controller,
        maxLines: maxLines,
        validator: (value) => validator(value),
        onTap: () => onTap(context, controller),
        onChanged: (value) => onChanged(filterKey, value),
        obscureText: obscureText,
        readOnly: readOnly,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: CustomColors.lightRed,
              width: 0.5,
            ),
          ),
          errorStyle: const TextStyle(color: CustomColors.lightRed),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: CustomColors.lightRed,
              width: 0.5,
            ),
          ),
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
          ),
          hintStyle: TextStyle(
            color: textColor,
            fontSize: 10,
          ),
          hintText: labelText.tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
