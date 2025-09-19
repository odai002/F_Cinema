import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
        color: Colors.white,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex, // الصفحة الحالية
        selectedItemColor: AppColors.primary, // لون الصفحة المحددة
        unselectedItemColor: Colors.white, // لون الصفحات الغير محددة
        backgroundColor: AppColors.secondry,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Settings',
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
    );
  }
}
