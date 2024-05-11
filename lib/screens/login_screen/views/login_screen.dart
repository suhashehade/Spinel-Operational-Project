import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logo_widget.dart';
import 'package:operations/common/buttons/red_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/login_screen/controller/login_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: CustomColors.pacificBlue,
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              const LogoWidget(),
              const SizedBox(
                height: 100.0,
              ),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(
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
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
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
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Messages.createAccountMessage.tr),
                      InkWell(
                        onTap: () {
                          controller.toRegistrationScreen();
                        },
                        child: Text(
                          Consts.registerCallToAction.tr,
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
                  RedButton(
                    title: Consts.login.tr,
                    handle: controller.handleLogin,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
