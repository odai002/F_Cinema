import 'package:cinema_reservations/Core/Constant/app_route.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/BottomNavBar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: const Text('Settings',style:TextStyle(color:AppColors.grey50),),
        centerTitle: true,
        backgroundColor:AppColors.secondry,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical:20),
        child: Column(
          children: [
           ListTile(
              leading:
              const Icon(Icons.edit_outlined, color: AppColors.primary),
              title: const Text('Edit Account'),
              onTap: () {
                Get.offNamed(AppRoute.EditProfile);
              },
            ),
            const Divider(),
            ListTile(
              leading:
              const Icon(Icons.article_outlined, color:AppColors.primary),
              title: const Text('Terms And Service'),
              onTap: () {

              },
            ),
            const Divider(),
            ListTile(
              leading:
              const Icon(Icons.logout_outlined, color:AppColors.primary),
              title: const Text('Logout'),
              onTap: () {
/*
                ServicesProvider.logout(context);
*/
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),

    );
  }
}
