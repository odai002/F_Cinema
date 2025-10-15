import 'package:flutter/material.dart';

import '../../../Core/Constant/colors.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;

  const InfoTile({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.secondry,
        size: width * 0.07,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: width * 0.04,
        ),
      ),
    );
  }
}
