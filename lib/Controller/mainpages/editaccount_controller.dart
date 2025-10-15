import 'dart:io';
import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:cinema_reservations/Data/Remote/Auth/token_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Core/utils/loading.dart';
import '../../Core/utils/snaksbar.dart';
import '../../Data/Remote/mainpages/editAccount_service.dart';

class EditaccountController extends GetxController {
  final GlobalKey<FormState> formstate55 = GlobalKey<FormState>();
  final EditAccountService _apiService = EditAccountService();

  // الحقول
  late TextEditingController fullName;
  late TextEditingController phoneNumber;
  late TextEditingController address;
  String gender = "Male";
  File? profileImage;

  @override
  void onInit() {
    fullName = TextEditingController();
    phoneNumber = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      update();
    }
  }

  void Cancel() {
    Get.back();
  }

  Future<void> Save() async {
    final token = await TokenService.getToken();

    try {
      showLoading();

      Map<String, dynamic> response;
      if (profileImage != null &&
          fullName.text.isEmpty &&
          phoneNumber.text.isEmpty &&
          address.text.isEmpty) {
        response = await _apiService.uploadProfileImage(
          token: token!,
          imageFile: profileImage!,
        );
      }
      else if (formstate55.currentState!.validate()) {
        response = await _apiService.updateProfileInfo(
          token: token!,
          fullName: fullName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          address: address.text.trim(),
          gender: gender,
        );
      }
      // لا توجد بيانات صحيحة
      else {
        hideLoading();
        showErrorSnackbar("Please fill valid information or upload an image");
        return;
      }

      hideLoading();

      if (response['success'] == true) {
        showSuccessSnackbar("Profile updated successfully");
        Get.offNamed(AppRoute.Profile);
      } else {
        showErrorSnackbar(response['message'] ?? "Failed to update profile");
      }
    } catch (e) {
      hideLoading();
      showErrorSnackbar("Something went wrong: $e");
    }
  }
}
