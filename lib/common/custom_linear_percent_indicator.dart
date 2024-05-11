import 'package:flutter/material.dart';
import 'package:operations/models/level/level.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class CustomLinearPercentIndicator extends StatelessWidget {
  CustomLinearPercentIndicator(
      {super.key, required this.l, required this.handle});
  Level l;
  Function handle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: CustomColors.black,
        ),
        color: CustomColors.softPeach,
      ),
      child: Column(
        children: [
          LinearPercentIndicator(
            backgroundColor: CustomColors.softPeach,
            progressColor: l.percent < 0.5
                ? CustomColors.lightRed
                : l.percent == 1.0
                    ? CustomColors.lightGreen
                    : CustomColors.lightYellow,
            lineHeight: MediaQuery.of(context).size.height * 0.05,
            percent: l.percent,
            animation: true,
            animationDuration: 500,
            center: InkWell(
              onTap: () {
                handle(l);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 15.0,
                    width: 15.0,
                    child: Assets.rightwardIcon,
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        l.name,
                      )),
                ],
              ),
            ),
          ),
          LinearPercentIndicator(
            backgroundColor: CustomColors.softPeach,
            progressColor: l.percent < 0.5
                ? CustomColors.red
                : l.percent == 1.0
                    ? CustomColors.green
                    : CustomColors.yellow,
            lineHeight: 12,
            percent: l.percent,
            animation: true,
            animationDuration: 500,
            center: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  '${l.percent * 100}%',
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
