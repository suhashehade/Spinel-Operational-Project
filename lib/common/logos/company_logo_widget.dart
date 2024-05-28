import 'package:flutter/material.dart';
import 'package:operations/utils/assets.dart';

class CompanyLogoWidget extends StatelessWidget {
  const CompanyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 250.0,
      child: Assets.companyLogo,
    );
  }
}
