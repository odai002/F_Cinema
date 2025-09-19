import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/app_route.dart';

abstract class SignupController extends GetxController{
  SignUp();
  Cancel();
}
class SignupControllerImp extends SignupController{
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController Confirmpassword;

  bool issShowPassword=true;

  ShowPassword(){
    issShowPassword = issShowPassword ==true ? false : true;
    update();
  }
  @override
  SignUp() {
    var formdata= formstate1.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.Login);
    }
  }

  @override
  Cancel() {
    Get.back();
  }


@override
  void onInit() {
    username = TextEditingController();
    email= TextEditingController();
    phone=TextEditingController();
    password=TextEditingController();
    Confirmpassword = TextEditingController();
  }

void dispose(){
    password.dispose();
    Confirmpassword.dispose();
}
}