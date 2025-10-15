import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.dialog(
    const Center(child: CircularProgressIndicator()),
    barrierDismissible: false,
  );
}

void hideLoading() {
  Get.back();
}
