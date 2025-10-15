import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/Core/localization/changelocale.dart';
import 'package:cinema_reservations/View/Widget/language/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Constant/app_route.dart';

class Language extends StatelessWidget {
  LocaleController controller = Get.find();
   Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: const EdgeInsets.all(15),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
             Text("1".tr,style:const TextStyle(color:AppColors.secondry,fontWeight:FontWeight.bold,fontSize:25),),
           const SizedBox(height:25,),
           ButtonWidget(textbutton: "Arabic", onpressed: ()async{
             controller.changeLang("ar");
             await Future.delayed(const Duration(milliseconds: 300));
             Get.offNamed(AppRoute.Login);
           }),
            const SizedBox(height:15,),
            ButtonWidget(textbutton: "English", onpressed: ()async{
              controller.changeLang("en");
              await Future.delayed(const Duration(milliseconds: 300)); // ⏳ لتأكيد التحديث
              Get.offNamed(AppRoute.Login);
            }),

          ],
        ),
      ),
    );
  }
}
