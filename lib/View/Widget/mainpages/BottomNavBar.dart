import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/Responsive.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.getWidth(context);
    final double radius = width * 0.05; // نسبة من عرض الشاشة
    final double iconSize = width * 0.07; // حجم الأيقونات Responsive

    int currentIndex = 0;
    String? currentRoute = Get.currentRoute;

    if (currentRoute == AppRoute.FelimsCategory) {
      currentIndex = 0;
    } else if (currentRoute == AppRoute.Profile) {
      currentIndex = 1;
    } else if (currentRoute == AppRoute.Settings) {
      currentIndex = 2;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
        color: AppColors.secondry,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.secondry,
          elevation: 0,
          selectedFontSize: width * 0.035,
          unselectedFontSize: width * 0.03,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: iconSize),
              label: '165'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: iconSize),
              label: '164'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: iconSize),
              label: '156'.tr,
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                if (currentRoute != AppRoute.FelimsCategory) {
                  Get.offNamed(AppRoute.FelimsCategory);
                }
                break;
              case 1:
                if (currentRoute != AppRoute.Profile) {
                  Get.offNamed(AppRoute.Profile);
                }
                break;
              case 2:
                if (currentRoute != AppRoute.Settings) {
                  Get.offNamed(AppRoute.Settings);
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
