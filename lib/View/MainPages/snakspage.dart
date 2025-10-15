import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/colors.dart';
import '../../Data/Model/snaks/snack.dart';
import '../Widget/sncak_card.dart';

class Snakspage extends StatelessWidget {
  const Snakspage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 120.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();

    final List<SnackItem> snacks = [
      SnackItem(
        id: "1",
        name: "fresh",
        category: "Salty",
        price: 10000,
        image: "assets/batekh.jpg",
      ),
      SnackItem(
        id: "2",
        name: "fresh",
        category: "Sweet",
        price: 15000,
        image: "assets/batekh.jpg",
      ),
      SnackItem(
        id: "3",
        name: "Juice",
        category: "Juice",
        price: 8000,
        image: "assets/frute.jpeg",
      ),
      SnackItem(
        id: "4",
        name: "Laemon",
        category: "Food",
        price: 15000,
        image: "assets/lemon.jpeg",
      ),
      SnackItem(
        id: "4",
        name: "moheto",
        category: "Food",
        price: 22000,
        image: "assets/moheto.jpeg",
      ),
      SnackItem(
        id: "4",
        name: "orange",
        category: "Food",
        price: 25000,
        image: "assets/orange.jpeg",
      ),
      SnackItem(
        id: "4",
        name: "Qewe",
        category: "Food",
        price: 25000,
        image: "assets/qewe.jpeg",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: const Text(
          'Snacks Page',
          style: TextStyle(color: AppColors.grey50),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose the Snack you want....',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: snacks.length,
                itemBuilder: (context, index) {
                  final snack = snacks[index];
                  return SnackCard(
                    snack: snack,
                    onTap: () {
                      Get.back(result: snack);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
