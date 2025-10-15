import 'dart:ui';

import 'package:cinema_reservations/Core/service/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();


  changeLang(String codeLanguage){
    Locale locale = Locale(codeLanguage);
    myServices.sharedPref.setString("lang", codeLanguage);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedpreflang = myServices.sharedPref.getString("lang");
    if (sharedpreflang == "ar") {
      language =  Locale("ar");
    } else if (sharedpreflang == "en") {
      language =  Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

}