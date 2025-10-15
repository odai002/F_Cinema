
import 'package:cinema_reservations/View/Auth/login/login.dart';
import 'package:cinema_reservations/View/MainPages/edit_profile.dart';
import 'package:cinema_reservations/View/MainPages/felims_category.dart';
import 'package:cinema_reservations/View/MainPages/profile.dart';
import 'package:cinema_reservations/View/MainPages/reservation_page.dart';
import 'package:cinema_reservations/View/MainPages/settings.dart';
import 'package:cinema_reservations/View/language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Core/Constant/app_route.dart';
import 'View/Auth/SignUp/signup.dart';
import 'View/Splach/splach_screen.dart';

List<GetPage<dynamic>>? routes =[
  //Splach

  GetPage(name:AppRoute.SplachScreen, page: () =>const SplashScreen()),
  GetPage(name:AppRoute.Language, page: () => Language()),
// Auth
  GetPage(name:AppRoute.Login , page: () => const Login()),
  GetPage(name:AppRoute.SignUp , page: () => const SignUp()),
  GetPage(name:AppRoute.FelimsCategory , page: () => const FelimsCategory()),
  GetPage(name:AppRoute.ReservationPage , page: () => const ReservationPage()),
  GetPage(name:AppRoute.Profile , page: () =>  const ProfilePage()),
  GetPage(name:AppRoute.EditProfile , page: () =>   EditProfile()),
  GetPage(name:AppRoute.Settings , page: () => const SettingPage()),





];

