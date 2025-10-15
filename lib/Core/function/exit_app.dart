import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> showExitDialog() async {
  return await Get.dialog(
    AlertDialog(
      backgroundColor:AppColors.primary,
      title: const Text("Exit App",style:TextStyle(color: AppColors.grey50),),
      content: const Text("Do you want exit App?",style:TextStyle(color: AppColors.grey50),),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text("No",style:TextStyle(color: AppColors.grey50),),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text("Yes",style:TextStyle(color: AppColors.grey50),),
        ),
      ],
    ),
    barrierDismissible: false,
  ) ?? false;
}
