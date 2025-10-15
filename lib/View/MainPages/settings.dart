import 'package:cinema_reservations/Controller/mainpages/settings_controller.dart';
import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Responsive.dart';
import '../../Core/localization/changelocale.dart';
import '../Widget/mainpages/BottomNavBar.dart';
import '../language.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    final LocaleController localeController = Get.find();

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
          '156'.tr,
          style: TextStyle(
            color: AppColors.grey50,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.025,
        ),
        child: Column(
          children: [
            // 🔹 تغيير اللغة
            ListTile(
              leading: Icon(
                Icons.language_outlined,
                color: const Color(0xff6A3BA8),
                size: width * 0.07,
              ),
              title: Text(
                '157'.tr,
                style: TextStyle(fontSize: width * 0.045),
              ),
              trailing: DropdownButton<String>(
                value: localeController.language?.languageCode == 'en'
                    ? 'English'
                    : 'Arabic',
                underline: Container(),
                items: [
                  DropdownMenuItem<String>(
                    value: 'English',
                    child: Text(
                      '161'.tr,
                      style: TextStyle(fontSize: width * 0.043),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Arabic',
                    child: Text(
                      '162'.tr,
                      style: TextStyle(fontSize: width * 0.043),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value == 'English') {
                    localeController.changeLang('en');
                  } else if (value == 'Arabic') {
                    localeController.changeLang('ar');
                  }
                },
              ),
            ),
            Divider(height: height * 0.005, thickness: 1),

            // 🔹 تعديل الحساب
            ListTile(
              leading: Icon(
                Icons.edit_outlined,
                color: AppColors.secondry,
                size: width * 0.07,
              ),
              title: Text(
                '158'.tr,
                style: TextStyle(fontSize: width * 0.045),
              ),
              onTap: () {
                Get.toNamed(AppRoute.EditProfile);
              },
            ),
            Divider(height: height * 0.005, thickness: 1),

            // 🔹 المقالات
            ListTile(
              leading: Icon(
                Icons.article_outlined,
                color: AppColors.secondry,
                size: width * 0.07,
              ),
              title: Text(
                '160'.tr,
                style: TextStyle(fontSize: width * 0.045),
              ),
              onTap: () {},
            ),
            Divider(height: height * 0.005, thickness: 1),

            // 🔹 تسجيل الخروج
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: AppColors.secondry,
                size: width * 0.07,
              ),
              title: Text(
                '159'.tr,
                style: TextStyle(fontSize: width * 0.045),
              ),
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
