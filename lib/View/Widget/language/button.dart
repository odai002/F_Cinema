import 'package:flutter/material.dart';

import '../../../Core/Constant/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String textbutton;
  void Function()? onpressed;
   ButtonWidget({super.key, required this.textbutton,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(horizontal: 100),
      width:double.infinity,
      child:MaterialButton(
        onPressed:onpressed,
        color:AppColors.primary,
        textColor:AppColors.grey50,
        child:  Text(textbutton,style:const TextStyle(fontWeight:FontWeight.bold),),
      ),
    );
  }
}
