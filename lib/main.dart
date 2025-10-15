import 'package:cinema_reservations/Core/localization/changelocale.dart';
import 'package:cinema_reservations/Core/service/services.dart';
import 'package:cinema_reservations/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Core/Constant/app_route.dart';
import 'Core/localization/translation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return  GetMaterialApp(
      locale:controller.language,
      translations:MyTranslation(),
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoute.SplachScreen,
      getPages: routes,
    );
  }
}