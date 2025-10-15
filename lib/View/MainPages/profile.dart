import 'package:cinema_reservations/Core/Constant/url.dart';
import 'package:cinema_reservations/View/Widget/profile/listTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/mainpages/profile_controller.dart';
import '../../Core/Constant/colors.dart';
import '../../Core/Constant/Responsive.dart';
import '../Widget/mainpages/BottomNavBar.dart';
import '../Widget/profile/profile_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
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
          '164'.tr,
          style: TextStyle(
            color: AppColors.grey50,
            fontSize: width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: SingleChildScrollView(
          child: Center(
            child: Obx(() {
              final profile = controller.userProfile;

              if (profile.isEmpty) {
                return const CircularProgressIndicator();
              }

              final String? imageUrl = profile['profile']['profileImageUrl'] != null
                  ? '${AppLink.imageUrl}${profile['profile']['profileImageUrl']}'
                  : null;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.03),
                  ProfileAvatar(
                    width: width,
                    imageUrl: profile['profile']['profileImageUrl'] != null
                        ? '${AppLink.imageUrl}${profile['profile']['profileImageUrl']}'
                        : null,
                  ),

                  SizedBox(height: height * 0.03),

                  InfoTile(
                    icon: Icons.person_rounded,
                    text: profile['profile']['fullName'] ?? "",
                    width: width,
                  ),

                  SizedBox(height: height * 0.025),
                  InfoTile(
                    icon: Icons.email_rounded,
                    text: profile['profile']['email'] ?? "",
                    width: width,
                  ),

                  SizedBox(height: height * 0.025),
                  InfoTile(
                    icon: Icons.phone_android_rounded,
                    text: profile['profile']['phoneNumber'] ?? "",
                    width: width,
                  ),

                  SizedBox(height: height * 0.025),

                  InfoTile(
                    icon: Icons.wc_rounded,
                    text: profile['profile']['gender'] ?? "",
                    width: width,
                  ),

                  SizedBox(height: height * 0.025),
                  InfoTile(
                    icon: Icons.location_on_rounded,
                    text: profile['profile']['address'] ?? "",
                    width: width,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
  }
