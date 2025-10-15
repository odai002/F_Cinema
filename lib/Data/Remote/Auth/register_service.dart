import 'dart:convert';

import 'package:cinema_reservations/Data/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/url.dart';
import 'package:http/http.dart' as http;
class SignupService {

  Future<void> Register(User user) async {
  String url = AppLink.Register;

  try {
  final response = await http.post(
  Uri.parse(url),
  headers: {"Content-Type": "application/json"},
  body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
  Get.snackbar(
  "نجاح",
  "تم تسجيل الحساب بنجاح",
  snackPosition: SnackPosition.TOP,
  backgroundColor: Colors.green,
  colorText: Colors.white,
  borderRadius: 20,
  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
  duration: const Duration(seconds: 3),
  isDismissible: true,
  animationDuration: const Duration(milliseconds: 500),
  );
  } else {
  Get.snackbar(
  "خطأ",
  "حدث خطأ أثناء التسجيل",
  snackPosition: SnackPosition.TOP,
  backgroundColor: Colors.red,
  colorText: Colors.white,
  borderRadius: 20,
  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
  duration: Duration(seconds: 3),
  isDismissible: true,
  animationDuration: const Duration(milliseconds: 500),
  );
  }
  } catch (e) {
  // في حال حدوث أي خطأ مثل انقطاع الانترنت
  Get.snackbar(
  "خطأ في الاتصال",
  "يرجى التحقق من اتصالك بالإنترنت",
  snackPosition: SnackPosition.TOP,
  backgroundColor: Colors.red,
  colorText: Colors.white,
  borderRadius: 20,
  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
  duration: Duration(seconds: 3),
  isDismissible: true,
  animationDuration: const Duration(milliseconds: 500),
  );
  print("SignupService.Register Error: $e"); // للمراجعة في الـ debug
  }
  }


}