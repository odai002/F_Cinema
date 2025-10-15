import 'dart:io';
import 'package:flutter/material.dart';

import '../../../Core/Constant/colors.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final String? imageUrl; // للصورة من السيرفر
  final File? localImage; // للصورة المختارة محلياً
  final VoidCallback? onCameraPressed; // زر الكاميرا
  final bool showCameraButton; // هل نعرض زر الكاميرا أم لا

  const ProfileAvatar({
    super.key,
    required this.width,
    this.imageUrl,
    this.localImage,
    this.onCameraPressed,
    this.showCameraButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width * 0.3,
            height: width * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.secondry,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: width * 0.15,
              backgroundColor: Colors.grey[300],
              backgroundImage: localImage != null
                  ? FileImage(localImage!)
                  : (imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : const AssetImage('assets/profile.png')
              as ImageProvider),
            ),
          ),
          if (showCameraButton && onCameraPressed != null)
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondry,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                onPressed: onCameraPressed,
              ),
            ),
        ],
      ),
    );
  }
}
