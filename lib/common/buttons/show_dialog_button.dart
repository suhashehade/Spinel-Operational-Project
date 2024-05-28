import 'package:flutter/material.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class ShowDialogButton extends StatelessWidget {
  ShowDialogButton(
      {super.key,
      required this.title,
      required this.handle,
      required this.arguments});
  String title;
  Function handle;
  Object? arguments;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        handle(arguments ?? Object(), context);
      },
      color: CustomColors.whiteTransparent50,
      height: MediaQuery.of(context).size.height * 0.05,
      minWidth: MediaQuery.of(context).size.width * 0.25,
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
