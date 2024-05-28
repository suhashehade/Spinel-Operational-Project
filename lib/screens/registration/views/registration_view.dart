import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logos/spinel_light_logo_widget.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/registration/controller/registration_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';
import 'package:operations/utils/routes.dart';

class RegistrationScreen extends GetView<RegistrationScreenController> {
  RegistrationScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        color: CustomColors.pacificBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            const SpinelLogoWidget(),
            const SizedBox(
              height: 100.0,
            ),
            Form(
                child: Column(
              children: [
                CustomTextFormField(
                  readOnly: false,
                  textAlign: TextAlign.start,
                  textColor: CustomColors.white,
                  heightRatio: 0.07,
                  borderColor: CustomColors.white,
                  widthRatio: 0.95,
                  fillColor: CustomColors.softPeach,
                  maxLines: 1,
                  controller: controller.usernameController,
                  textInputType: TextInputType.text,
                  labelText: Consts.username.tr,
                  obscureText: false,
                  validator: () {},
                  onTap: (context, controller) {},
                  onChanged: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  readOnly: false,
                  textAlign: TextAlign.start,
                  textColor: CustomColors.white,
                  heightRatio: 0.07,
                  borderColor: CustomColors.white,
                  widthRatio: 0.95,
                  fillColor: CustomColors.softPeach,
                  maxLines: 1,
                  controller: controller.phoneController,
                  textInputType: TextInputType.text,
                  labelText: Consts.phone.tr,
                  obscureText: false,
                  validator: () {},
                  onTap: (context, controller) {},
                  onChanged: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  readOnly: false,
                  textAlign: TextAlign.start,
                  textColor: CustomColors.white,
                  heightRatio: 0.07,
                  borderColor: CustomColors.white,
                  widthRatio: 0.95,
                  fillColor: CustomColors.softPeach,
                  maxLines: 1,
                  controller: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  labelText: Consts.email.tr,
                  obscureText: false,
                  validator: () {},
                  onTap: (context, controller) {},
                  onChanged: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  readOnly: false,
                  textAlign: TextAlign.start,
                  textColor: CustomColors.white,
                  heightRatio: 0.07,
                  borderColor: CustomColors.white,
                  widthRatio: 0.95,
                  fillColor: CustomColors.softPeach,
                  maxLines: 1,
                  controller: controller.passwordController,
                  textInputType: TextInputType.visiblePassword,
                  labelText: Consts.password.tr,
                  obscureText: true,
                  validator: () {},
                  onTap: (context, controller) {},
                  onChanged: () {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Messages.loginMessage.tr),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      child: Text(
                        Consts.login.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SubmitButton(
                  title: Consts.register.tr,
                  handle: controller.handleRegistration,
                  formKey: _keyForm,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
