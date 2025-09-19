import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  ToSignUp();
  Login();
}
  class LoginControllerImp extends LoginController{
GlobalKey<FormState> formstate = GlobalKey<FormState>();
 late TextEditingController email;
 late TextEditingController password;
 bool issShowPassword=true;

 ShowPassword(){
 issShowPassword = issShowPassword ==true ? false : true;
 update();
 }
  @override
  Login() {
   var formdata= formstate.currentState;
   try{
     if (formdata!.validate()) {
       Get.dialog(
         const Center(child: CircularProgressIndicator()),
         barrierDismissible: false,
       );
       Get.offNamed(AppRoute.FelimsCategory);
     }
   }catch(e){
     Get.snackbar(
       "Error",
       e.toString().replaceAll('Exception: ', ''),
       snackPosition: SnackPosition.BOTTOM,
       backgroundColor: AppColors.primary.withOpacity(0.3),
       colorText: AppColors.error,
     );
   }
  }

  @override
  ToSignUp() {
    Get.offAllNamed(AppRoute.SignUp);
  }
  @override
  void onInit() {
    email=TextEditingController();
    password = TextEditingController();
  }
  }
