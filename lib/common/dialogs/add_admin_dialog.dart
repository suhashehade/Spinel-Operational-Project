import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

// ignore: must_be_immutable
class AddAdminDialog extends StatelessWidget {
  AddAdminDialog({
    super.key,
    required this.controller,
    required this.validator,
    required this.onTap,
    required this.handle,
  });
  Function validator;
  Function onTap;
  Function handle;
  TextEditingController controller;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            CustomTextFormField(
              readOnly: false,
              textAlign: TextAlign.start,
              textColor: CustomColors.black,
              heightRatio: 0.07,
              borderColor: CustomColors.white,
              maxLines: 1,
              controller: controller,
              textInputType: TextInputType.text,
              labelText: Consts.adminName,
              obscureText: false,
              validator: validator,
              onTap: onTap,
              onChanged: () {},
              fillColor: CustomColors.white,
              widthRatio: 0.80,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SubmitButton(
              title: Consts.save.tr,
              handle: () {},
              formKey: _keyForm,
            ),
          ],
        ),
      ),
    );
  }
}
