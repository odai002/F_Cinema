import 'package:cinema_reservations/Data/Remote/Auth/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/app_route.dart';

import '../../Core/utils/loading.dart';
import '../../Core/utils/snaksbar.dart';
import '../../Data/Model/user.dart';
abstract class SignupController extends GetxController{
  Register();
  Cancel();
}
class SignupControllerImp extends SignupController {
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();
  late TextEditingController fullName, email, phoneNumber, password, confirmPassword;
  final SignupService register = SignupService();
  bool issShowPassword = true;

  @override
  void onInit() {
  fullName = TextEditingController();
  email = TextEditingController();
  phoneNumber = TextEditingController();
  password = TextEditingController();
  confirmPassword = TextEditingController();
  super.onInit();
  }

  @override
  void dispose() {
  fullName.dispose();
  email.dispose();
  phoneNumber.dispose();
  password.dispose();
  confirmPassword.dispose();
  super.dispose();
  }

  ShowPassword() {
  issShowPassword = !issShowPassword;
  update();
  }

  @override
  Register() async {
  if (formstate1.currentState!.validate()) {
  showLoading();
  try {
  User user = User(
  fullName: fullName.text,
  email: email.text,
  phoneNumber: phoneNumber.text,
  password: password.text,
  confirmPassword: confirmPassword.text,
  );
  await register.Register(user);
  hideLoading();
  Get.offNamed(AppRoute.Login);
  showSuccessSnackbar("تم تسجيل الحساب بنجاح");
  } catch (e) {
  hideLoading();
  showErrorSnackbar("حدث خطأ أثناء التسجيل");
  }
  } else {
  showWarningSnackbar("يرجى ملء جميع الحقول بشكل صحيح");
  }
  }

  @override
  Cancel() => Get.offAllNamed(AppRoute.Login);
  }
