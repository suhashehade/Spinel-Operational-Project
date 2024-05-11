import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    required this.fillColor,
    required this.fontColor,
    required this.widthRatio,
  });
  late TextEditingController controller;

  late Function validator;
  late Function onTap;
  late bool obscureText;
  late TextInputType textInputType;
  late String labelText;
  late Color fillColor;
  late Color fontColor;
  late double widthRatio;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * widthRatio,
      child: TextFormField(
        controller: controller,
        validator: (value) => validator(value),
        onTap: () => onTap(),
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
              color: CustomColors.white,
              width: 0.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: CustomColors.white,
              width: 0.5,
            ),
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search,
                color: fontColor,
                size: 15.0,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                labelText.tr,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
