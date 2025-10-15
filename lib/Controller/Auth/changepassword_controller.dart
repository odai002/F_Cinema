import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema_reservations/Core/service/services.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isPasswordHidden = true;
  final MyServices myServices = Get.find();

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      final oldPass = currentPassword.text;
      final newPass = newPassword.text;

      // 🔹 استدعاء API لتغيير كلمة المرور
      // مثال بسيط (استبدله باستدعاءك الحقيقي):
      try {
        // await ApiService.changePassword(oldPass, newPass);
        Get.snackbar(
          "Success",
          "Password updated successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // تنظيف الحقول بعد النجاح
        currentPassword.clear();
        newPassword.clear();
        confirmPassword.clear();
      } catch (e) {
        Get.snackbar(
          "Error",
          "Failed to update password",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
