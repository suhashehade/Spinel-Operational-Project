import 'package:flutter/material.dart';
import 'package:operations/utils/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class CustomLinearPercentIndicator extends StatelessWidget {
  CustomLinearPercentIndicator(
      {super.key, required this.percent, required this.handle});
  double percent;
  Function handle;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      backgroundColor: CustomColors.whiteTransparent50,
      progressColor: percent < 50.0
          ? CustomColors.lightRed
          : percent == 100.0
              ? CustomColors.lightGreen
              : CustomColors.lightYellow,
      lineHeight: 20,
      percent: percent / 100,
      barRadius: const Radius.circular(10),
      animation: true,
      animationDuration: 500,
      center: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
