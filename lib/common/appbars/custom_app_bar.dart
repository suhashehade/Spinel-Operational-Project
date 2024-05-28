import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.scaffoldKey});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Consts.projectName.tr),
      backgroundColor: CustomColors.pacificBlue,
      leading: IconButton(
        icon: Assets.spinelDarkLogo,
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
