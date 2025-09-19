import 'package:cinema_reservations/Controller/mainpages/category_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/View/Widget/Custom_Appar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Core/function/exit_app.dart';
import '../Widget/BottomNavBar.dart';
import 'moviesbycategorypage.dart';

class FelimsCategory extends StatelessWidget {
  const FelimsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController controller = CategoryController();
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 120.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return Scaffold(
/*
      backgroundColor:AppColors.primary,
*/
      appBar: CustomAppBar(title: '',),
      body: WillPopScope(
        onWillPop: () async {
          bool exit = await showExitDialog();
          return exit;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Choose the type of movie you want....',
                style: TextStyle(
                  fontSize: 18,
                  color:Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:(){
                        Get.to(() => MoviesByCategoryPage());
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.secondry,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  controller.images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            controller.texts[index],
                            style: const TextStyle(
                              color:Colors.black,
                              fontSize: 14,
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
