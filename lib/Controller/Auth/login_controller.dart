import 'package:cinema_reservations/Core/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/app_route.dart';
import '../../Core/utils/loading.dart';
import '../../Core/utils/snaksbar.dart';
import '../../Data/Remote/Auth/login_service.dart';
import '../../Data/Remote/Auth/token_service.dart';
import '../../View/Auth/login/login.dart';


abstract class LoginController extends GetxController {
  void Login();
  void ToSignUp();
  void ShowPassword();
}

class LoginControllerImp extends LoginController {
  MyServices myServices =Get.find();
  // Key للنموذج
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // Controllers للنصوص
  late TextEditingController email;
  late TextEditingController password;

  // خدمة تسجيل الدخول
  final LoginService loginService = LoginService();

  // التحكم في إظهار/إخفاء كلمة المرور
  bool issShowPassword = true;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  ShowPassword() {
    issShowPassword = !issShowPassword;
    update(); // لتحديث واجهة المستخدم
  }

  @override
  Login() async {
    if (formstate.currentState!.validate()) {
      showLoading(); // عرض Loading
      try {
        final token = await loginService.Login(email.text, password.text);
        myServices.sharedPref.setBool("isLoggedIn", true);
        await TokenService.saveToken(token);

        hideLoading();
        showSuccessSnackbar("تم تسجيل الدخول بنجاح");
        Get.offAllNamed(AppRoute.FelimsCategory);

      } catch (e) {
        hideLoading();
        showErrorSnackbar("فشل تسجيل الدخول، تحقق من بياناتك");
      }
    } else {
      showWarningSnackbar("يرجى ملء جميع الحقول بشكل صحيح");
    }
  }

  @override
  ToSignUp() {
    Get.offAllNamed(AppRoute.SignUp);
  }
}
