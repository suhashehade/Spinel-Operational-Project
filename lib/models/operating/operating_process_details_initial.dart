import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperatingProcessDetailsInitialItems {
  int? value;
  String? labelEn;
  String? labelAr;
  RxDouble? amount;
  RxBool isOpened;
  TextEditingController controller;
  OperatingProcessDetailsInitialItems(
    this.value,
    this.labelEn,
    this.labelAr,
    double? amount,
  )   : isOpened = false.obs,
        amount = (amount ?? 0.1).obs,
        controller = TextEditingController();

  factory OperatingProcessDetailsInitialItems.fromJson(json) {
    return OperatingProcessDetailsInitialItems(
      json['value'],
      json['labelEn'],
      json['labelAr'],
      json['amount'],
    );
  }
}
