import 'package:cinema_reservations/Controller/Auth/signup_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/Responsive.dart';
import '../../../Core/function/validate_input.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = Responsive.getHeight(context);
    final double width = Responsive.getWidth(context);

    SignupControllerImp controller = Get.put(SignupControllerImp());

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * 0.05),
            bottomRight: Radius.circular(width * 0.05),
          ),
        ),
        title: Text(
          '13'.tr,
          style: TextStyle(
            color: AppColors.grey50,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Form(
        key: controller.formstate1,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.03,
          ),
          child: ListView(
            children: [
              SizedBox(height: height * 0.02),
              Text(
                "13".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.07,
                  color: AppColors.secondry,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "14".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: AppColors.grey200,
                ),
              ),
              SizedBox(height: height * 0.08),

              // Username
              Customtextfailed(
                iconData: Icons.person,
                hintText: "15".tr,
                lableText: "16".tr,
                controller: controller.fullName,
                validator: (val) {
                  return validinput(val!, 3, 15, 'username');
                },
              ),
              SizedBox(height: height * 0.03),

              // Email
              Customtextfailed(
                iconData: Icons.email_outlined,
                hintText: "17".tr,
                lableText: "18".tr,
                controller: controller.email,
                validator: (val) {
                  return validinput(val!, 10, 50, 'email');
                },
              ),
              SizedBox(height: height * 0.025),

              // Phone
              Customtextfailed(
                iconData: Icons.phone,
                hintText: "19".tr,
                lableText: "20".tr,
                controller: controller.phoneNumber,
                validator: (val) {
                  return validinput(val!, 10, 10, 'phone');
                },
              ),
              SizedBox(height: height * 0.025),

              // Password
              GetBuilder<SignupControllerImp>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.remove_red_eye_outlined,
                  hintText: '21'.tr,
                  lableText: '22'.tr,
                  controller: controller.password,
                  onTapIcon: () {
                    controller.ShowPassword();
                  },
                  obscureText: controller.issShowPassword,
                  validator: (val) {
                    return validinput(val!, 8, 30, "password");
                  },
                ),
              ),
              SizedBox(height: height * 0.025),

              // Confirm Password
              GetBuilder<SignupControllerImp>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.remove_red_eye_outlined,
                  hintText: "23".tr,
                  lableText: "23".tr,
                  controller: controller.confirmPassword,
                  onTapIcon: () {
                    controller.ShowPassword();
                  },
                  obscureText: controller.issShowPassword,
                  validator: (val) {
                    return validinput(val!, 8, 30, "password");
                  },
                ),
              ),
              SizedBox(height: height * 0.06),

              // Buttons
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customebutton(
                    text: '24'.tr,
                    onPressed: controller.Register,
                  ),
                  SizedBox(width: width * 0.04),
                  Customebutton(
                    text: '25'.tr,
                    onPressed: controller.Cancel,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
