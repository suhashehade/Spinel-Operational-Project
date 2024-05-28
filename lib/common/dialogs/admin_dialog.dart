import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/add_button.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

// ignore: must_be_immutable
class AdminsDialog extends StatelessWidget {
  AdminsDialog({super.key, required this.addFunction});
  Function addFunction;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.40,
      color: CustomColors.softPeach,
      child: SingleChildScrollView(
        child: Form(
          key: _keyForm,
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
                                boxShadow: const [
                                  BoxShadow(
                                    color: CustomColors.lightGrey,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.outer,
                                  )
                                ],
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
              SubmitButton(
                title: Consts.save.tr,
                handle: () {},
                formKey: _keyForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
