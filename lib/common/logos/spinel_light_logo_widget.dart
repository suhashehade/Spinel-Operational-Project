import 'package:flutter/material.dart';
import 'package:operations/utils/assets.dart';

class SpinelLogoWidget extends StatelessWidget {
  const SpinelLogoWidget({super.key});
  final double top = 0.0; // 270
  final double left = 0.0; // 130

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: Assets.spinelLightLogo,
    );
  }
}
