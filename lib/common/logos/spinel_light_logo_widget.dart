import 'package:flutter/material.dart';
import 'package:operations/utils/assets.dart';

class SpinelLogoWidget extends StatelessWidget {
  const SpinelLogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: Assets.spinelLightLogo,
    );
  }
}
