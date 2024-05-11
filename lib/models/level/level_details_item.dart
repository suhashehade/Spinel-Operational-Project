import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LevelDetailsItem {
  String title;
  int status;
  String note;
  RxBool isOpened;
  TextEditingController controller;

  LevelDetailsItem(
    this.title,
    this.status,
    this.note,
  )   : isOpened = false.obs,
        controller = TextEditingController();
}
