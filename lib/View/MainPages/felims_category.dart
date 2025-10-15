import 'package:cinema_reservations/Controller/mainpages/category_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/Core/Constant/Responsive.dart';
import 'package:cinema_reservations/View/Widget/mainpages/Custom_Appar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/function/exit_app.dart';
import '../Widget/mainpages/BottomNavBar.dart';
import 'moviesbycategorypage.dart';

class FelimsCategory extends StatelessWidget {
  const FelimsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController();

    // 🧭 استخدم الكلاس Responsive
    final double height = Responsive.getHeight(context);
    final double width = Responsive.getWidth(context);

    // 🔹 اجعل عدد الأعمدة ديناميكي حسب حجم الشاشة
    final double itemWidth = width * 0.28; // كان ثابت 120
    final int crossAxisCount = (width / itemWidth).floor();

    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: WillPopScope(
        onWillPop: () async {
          bool exit = await showExitDialog();
          return exit;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.05),

              // 🔹 العنوان
              Text(
                '27'.tr,
                style: TextStyle(
                  fontSize: width * 0.045, // responsive font
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: height * 0.02),

              // 🔹 الشبكة
              Expanded(
                child: GridView.builder(
                  itemCount: controller.images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: width * 0.02,
                    mainAxisSpacing: height * 0.02,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() =>  MoviesByCategoryPage());
                      },
                      child: Column(
                        children: [
                          // 🔹 الصورة
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.secondry,
                                  width: width * 0.005,
                                ),
                                borderRadius: BorderRadius.circular(width * 0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(width * 0.015),
                                child: Image.asset(
                                  controller.images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          // 🔹 النص
                          Text(
                            controller.texts[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.035, // responsive font
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
