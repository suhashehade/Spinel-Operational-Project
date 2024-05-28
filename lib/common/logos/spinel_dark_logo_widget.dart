import 'package:flutter/material.dart';
import 'package:operations/utils/assets.dart';

class SpinelDarkLogoWidget extends StatelessWidget {
  const SpinelDarkLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 60.0,
      child: Assets.spinelDarkLogo,
    );
  }
}
