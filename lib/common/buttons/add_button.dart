import 'package:flutter/material.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class AddButton extends StatelessWidget {
  AddButton({super.key, required this.onPressed});
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: MediaQuery.of(context).size.height * 0.05,
      color: CustomColors.red,
      shape: const CircleBorder(eccentricity: 0.05),
      onPressed: () {
        onPressed();
      },
      child: const Icon(Icons.add),
    );
  }
}
