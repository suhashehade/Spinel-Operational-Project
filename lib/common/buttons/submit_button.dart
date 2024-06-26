import 'package:flutter/material.dart';
import 'package:operations/utils/colors.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
  SubmitButton({
    super.key,
    required this.title,
    required this.handle,
    required this.formKey,
  });
  String title;
  Function handle;
  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          handle();
        }
      },
      color: CustomColors.tuna,
      height: MediaQuery.of(context).size.height * 0.05,
      minWidth: MediaQuery.of(context).size.width * 0.40,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        style: const TextStyle(color: CustomColors.white),
      ),
    );
  }
}
