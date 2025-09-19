// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Core/Constant/colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 14,
                spreadRadius: 2,
                offset: Offset.fromDirection(100))
          ]
      ),
      child: AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: const Text('Films Category',style:TextStyle(color:AppColors.grey50),),
        centerTitle: true,
        backgroundColor:AppColors.secondry,
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(55);
}