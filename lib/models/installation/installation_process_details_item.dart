import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class InstallationProcessDetailsItem {
  int? id;
  int? checkID;
  String? checkName;
  RxBool isYes;
  RxBool isNo;
  RxBool isSkipped;
  RxBool isConfirm;
  String? note;
  TextEditingController controller;
  RxBool isOpened;
  RxDouble amount;

  InstallationProcessDetailsItem(
    this.id,
    this.checkID,
    this.checkName,
    bool? isYes,
    bool? isNo,
    bool? isSkipped,
    bool? isConfirmed,
    this.amount,
    this.note,
  )   : isOpened = false.obs,
        isConfirm = (isConfirmed ?? false).obs,
        isYes = (isYes ?? false).obs,
        isNo = (isNo ?? false).obs,
        isSkipped = (isSkipped ?? false).obs,
        controller = TextEditingController(text: note ?? '');

  factory InstallationProcessDetailsItem.fromJson(json) {
    return InstallationProcessDetailsItem(
      json['id'],
      json['checkID'],
      json['checkName'],
      json['isYes'],
      json['isNo'],
      json['isSkipped'],
      json['isConfirm'],
      0.1.obs,
      json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'checkID': checkID,
      'checkName': checkName,
      'isYes': isYes.value,
      'isNo': isNo.value,
      'isSkipped': isSkipped.value,
      'isConfirmed': isConfirm.value,
      'note': controller.text,
    };
    return map;
  }
}
