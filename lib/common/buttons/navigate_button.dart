import 'package:flutter/material.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class NavigateButton extends StatelessWidget {
  NavigateButton(
      {super.key,
      required this.title,
      required this.handle,
      required this.arguments,
      required this.widthRatio});
  String title;
  Function handle;
  Object arguments;
  double widthRatio;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        handle(arguments);
      },
      color: CustomColors.whiteTransparent50,
      height: MediaQuery.of(context).size.height * 0.05,
      minWidth: MediaQuery.of(context).size.width * widthRatio,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        style: const TextStyle(color: CustomColors.black),
      ),
    );
  }
}
