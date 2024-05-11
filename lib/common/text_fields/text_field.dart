import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  late TextEditingController controller;
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
  CustomTextFormField({
    super.key,
    required this.maxLines,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.onTap,
    required this.fillColor,
    required this.widthRatio,
    required this.heightRatio,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightRatio,
      width: MediaQuery.of(context).size.width * widthRatio,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) => validator(value),
        onTap: () => onTap(context, controller),
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
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
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
          ),
          hintText: labelText.tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
