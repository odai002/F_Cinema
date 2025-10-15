import 'package:cinema_reservations/Controller/Auth/login_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/Core/function/validate_input.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/Auth/CustomeButton.dart';
import 'package:cinema_reservations/View/Widget/Auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/Responsive.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    final double height = Responsive.getHeight(context);
    final double width = Responsive.getWidth(context);

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
          '2'.tr,
          style: TextStyle(
            color: AppColors.grey50,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.03,
          ),
          child: ListView(
            children: [
              const Logo(),
              SizedBox(height: height * 0.02),
              Text(
                "3".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.07,
                  color: AppColors.secondry,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "4".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: AppColors.grey200,
                ),
              ),
              SizedBox(height: height * 0.08),

              // Email field
              Customtextfailed(
                iconData: Icons.email_outlined,
                hintText: '5'.tr,
                lableText: '6'.tr,
                controller: controller.email,
                validator: (val) {
                  return validinput(val!, 5, 50, "email");
                },
              ),
              SizedBox(height: height * 0.03),

              // Password field
              GetBuilder<LoginControllerImp>(
                builder: (controller) => Customtextfailed(
                  iconData: Icons.remove_red_eye_outlined,
                  hintText: '7'.tr,
                  lableText: '8'.tr,
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

              SizedBox(height: height * 0.015),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: height * 0.005,
                        right: width * 0.025,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.grey100,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "9".tr,
                          style: TextStyle(fontSize: width * 0.035),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.05),

              // Login Button
              GetBuilder<LoginControllerImp>(
                builder: (controller) => Customebutton(
                  text: '10'.tr,
                  onPressed: () {
                    controller.Login();
                  },
                ),
              ),

              SizedBox(height: height * 0.025),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '11'.tr,
                      style: TextStyle(fontSize: width * 0.035),
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: height * 0.005,
                      right: width * 0.02,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grey100,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.ToSignUp();
                      },
                      child: Text(
                        '12'.tr,
                        style: TextStyle(fontSize: width * 0.035),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
