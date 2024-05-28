import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/logos/company_logo_widget.dart';
import 'package:operations/common/logos/spinel_light_logo_widget.dart';
import 'package:operations/common/buttons/submit_button.dart';
import 'package:operations/common/text_fields/text_field.dart';
import 'package:operations/screens/login/controller/login_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';
import 'package:operations/utils/messages.dart';

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return !Get.isOpaqueRouteDefault;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  transform: GradientRotation(180),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.02,
                0.14,
                0.25,
                0.37,
                0.67,
                0.90,
                1.0,
              ],
                  colors: [
                CustomColors.tuna,
                CustomColors.gravel,
                CustomColors.liver,
                CustomColors.darkTaupe,
                CustomColors.lion,
                CustomColors.chalky,
                CustomColors.lightTan,
              ])),
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                const CompanyLogoWidget(),
                const SizedBox(
                  height: 25.0,
                ),
                Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              controller.toggle();
                            },
                            child: Obx(
                              () => DropdownButtonFormField(
                                  dropdownColor: CustomColors.grey,
                                  isDense: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return controller.validateLoginType(value);
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        borderSide: BorderSide(
                                            color: CustomColors.white)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: CustomColors.white,
                                        width: 0.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: CustomColors.white,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Select Type',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  items: [
                                    ...Lists.users
                                        .map<DropdownMenuItem>((value) {
                                      return DropdownMenuItem(
                                          onTap: () {
                                            controller
                                                .upadateSelectedType(value);
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: CustomColors.white,
                                                fontSize: 12),
                                          ));
                                    })
                                  ],
                                  onChanged: (value) {},
                                  value: controller.selectedType.value),
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFormField(
                          readOnly: false,
                          textAlign: TextAlign.start,
                          textColor: CustomColors.white,
                          heightRatio: 0.1,
                          borderColor: CustomColors.white,
                          widthRatio: 0.95,
                          fillColor: CustomColors.transparent,
                          maxLines: 1,
                          controller: controller.usernameController,
                          textInputType: TextInputType.text,
                          labelText: Consts.username.tr,
                          obscureText: false,
                          validator: controller.validator,
                          onTap: (context, controller) {},
                          onChanged: (value) {},
                        ),
                        CustomTextFormField(
                          readOnly: false,
                          textAlign: TextAlign.start,
                          textColor: CustomColors.white,
                          heightRatio: 0.1,
                          borderColor: CustomColors.white,
                          widthRatio: 0.95,
                          fillColor: CustomColors.transparent,
                          maxLines: 1,
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: Consts.password.tr,
                          obscureText: true,
                          validator: controller.validator,
                          onTap: (context, controller) {},
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 15.0,
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
                          height: 15.0,
                        ),
                        SubmitButton(
                          title: Consts.login.tr,
                          formKey: _keyForm,
                          handle: controller.handleLogin,
                        ),
                        Obx(() => Text(
                              controller.errorMessage.value,
                              style: const TextStyle(
                                color: CustomColors.lightRed,
                              ),
                            ))
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const SpinelLogoWidget(),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Consts.loginScreenSentance.tr,
                      style: const TextStyle(
                        color: CustomColors.richElectricBlue,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Container(
                      child: Assets.spinelText,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
