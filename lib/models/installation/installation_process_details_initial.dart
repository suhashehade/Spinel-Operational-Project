import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstallationDetailsInitialItems {
  int? value;
  String? labelEn;
  String? labelAr;
  RxDouble? amount;
  RxBool isOpened;
  TextEditingController controller;
  InstallationDetailsInitialItems(
    this.value,
    this.labelEn,
    this.labelAr,
    double? amount,
  )   : isOpened = false.obs,
        amount = (amount ?? 0.1).obs,
        controller = TextEditingController();

  factory InstallationDetailsInitialItems.fromJson(json) {
    return InstallationDetailsInitialItems(
      json['value'],
      json['labelEn'],
      json['labelAr'],
      json['amount'],
    );
  }
}
