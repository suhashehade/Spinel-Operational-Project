import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/add_button.dart';
import 'package:operations/common/buttons/red_button.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

// ignore: must_be_immutable
class AdminsDialog extends StatelessWidget {
  AdminsDialog({super.key, required this.addFunction});
  Function addFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.40,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddButton(
                  onPressed: addFunction,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...Lists.admins.map(
                        (a) => ListTile(
                          title: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: CustomColors.white,
                            ),
                            child: Text(a),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RedButton(
              title: Consts.save.tr,
              handle: () {},
            ),
          ],
        ),
      ),
    );
  }
}
