import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/colors.dart';
import '../Widget/BottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: const Text('Profile',style:TextStyle(color:AppColors.grey50),),
        centerTitle: true,
        backgroundColor:AppColors.secondry,
      ),
      body:const Padding(padding:  EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 22),
                  ListTile(
                    leading: Icon(Icons.person_rounded,
                        color: AppColors.primary),
                    title: Text("Username"),
                  ),
                  SizedBox(height: 22),
                  ListTile(
                    leading: Icon(Icons.email_rounded,
                        color: AppColors.primary),
                    title: Text("Email"),
                  ),
                  SizedBox(height: 22),
                  ListTile(
                    leading: Icon(Icons.phone_android_rounded,
                        color: AppColors.primary),
                    title: Text("Phone"),
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
