import 'package:get/get.dart';

import '../../Core/Constant/app_route.dart';
import '../../Data/Remote/Auth/token_service.dart';

class SettingsController extends GetxController{
logout()async{
  await TokenService.removeToken();
  Get.offAllNamed(AppRoute.Login);

}

  }