import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomeButton.dart';
import 'package:cinema_reservations/Core/function/validate_input.dart';

import '../../Controller/Auth/changepassword_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller = Get.put(ChangePasswordController());

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: AppColors.grey50),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Form(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Update your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: AppColors.secondry),
              ),
              const SizedBox(height: 40),
              GetBuilder<ChangePasswordController>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.lock_outline,
                  hintText: 'Enter your current password',
                  lableText: 'Current Password',
                  controller: controller.currentPassword,
                  obscureText: controller.isPasswordHidden,
                  onTapIcon: controller.togglePasswordVisibility,
                  validator: (val) {
                    return validinput(val!, 8, 30, 'password');
                  },
                ),
              ),
              const SizedBox(height: 25),

              // كلمة المرور الجديدة
              GetBuilder<ChangePasswordController>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.lock,
                  hintText: 'Enter your new password',
                  lableText: 'New Password',
                  controller: controller.newPassword,
                  obscureText: controller.isPasswordHidden,
                  onTapIcon: controller.togglePasswordVisibility,
                  validator: (val) {
                    return validinput(val!, 8, 30, 'password');
                  },
                ),
              ),
              const SizedBox(height: 25),

              // تأكيد كلمة المرور الجديدة
              GetBuilder<ChangePasswordController>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.lock_reset,
                  hintText: 'Confirm new password',
                  lableText: 'Confirm Password',
                  controller: controller.confirmPassword,
                  obscureText: controller.isPasswordHidden,
                  onTapIcon: controller.togglePasswordVisibility,
                  validator: (val) {
                    if (val != controller.newPassword.text) {
                      return "Passwords do not match";
                    }
                    return validinput(val!, 8, 30, 'password');
                  },
                ),
              ),

              const SizedBox(height: 50),
              Customebutton(
                text: 'Save',
                onPressed: () {
                  controller.changePassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
