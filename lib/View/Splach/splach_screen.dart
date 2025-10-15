import 'package:cinema_reservations/Core/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  final MyServices myServices = Get.find();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goNext();
      }
    });
  }

  void _goNext() {
    String? lang = myServices.sharedPref.getString("lang");
    bool? isLoggedIn = myServices.sharedPref.getBool("isLoggedIn");

    if (lang == null) {
      // 🔹 المستخدم لم يختر لغة بعد
      Get.offAllNamed(AppRoute.Language);
    } else if (isLoggedIn == true) {
      Get.offAllNamed(AppRoute.FelimsCategory); // غيّر AppRoute.Home إلى اسم مسارك الرئيسي
    } else {
      // 🔹 اختار لغة ولم يسجّل دخول → صفحة تسجيل الدخول
      Get.offAllNamed(AppRoute.Login);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photo_2025-08-29_21-34-56.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}