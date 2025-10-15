import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/colors.dart';

void showSuccessSnackbar(String message) {
  Get.snackbar(
    "نجاح",
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: AppColors.sucsess,
    colorText: AppColors.grey50,
    borderRadius: 20,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
    duration: const Duration(seconds: 3),
  );
}

void showErrorSnackbar(String message) {
  Get.snackbar(
    "خطأ",
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: AppColors.error,
    colorText:AppColors.grey50,
    borderRadius: 20,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
    duration: const Duration(seconds: 3),
  );
}

void showWarningSnackbar(String message) {
  Get.snackbar(
    "تنبيه",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.warning,
    colorText: AppColors.grey50,
  );
}
