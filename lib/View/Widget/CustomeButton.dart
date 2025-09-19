import 'package:flutter/material.dart';

import '../../Core/Constant/colors.dart';

class Customebutton extends StatelessWidget {
  String text;
   void Function()? onPressed;
   Customebutton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:OutlineInputBorder(
          borderRadius:BorderRadius.circular(20)
      ),
      onPressed: onPressed,
      padding:const EdgeInsets.all(15),
      minWidth:30,
      height:20,
      color:AppColors.secondry,
      child:  Text(text,style:const TextStyle(color:AppColors.grey50,fontSize:20),),
    );
  }
}
