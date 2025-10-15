import 'package:cinema_reservations/View/MainPages/reservation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/colors.dart';
import '../Widget/mainpages/BottomNavBar.dart';
import '../Widget/movies_category/movie_card.dart';

class MoviesByCategoryPage extends StatelessWidget {
  MoviesByCategoryPage({super.key});

/*
  final String category = Get.arguments as String; // استلام التصنيف من GetX
*/

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "title": "John Wick 4",
        "image": "assets/comedy.png",
        "time": "8:30 PM",
        "rating": 4.7
      },
      {
        "title": "Titanic",
        "image": "assets/comedy.png",
        "time": "6:00 PM",
        "rating": 4.9
      },
      {
        "title": "The Mask",
        "image": "assets/comedy.png",
        "time": "10:00 PM",
        "rating": 4.5
      },
      {
        "title": "The Mask",
        "image": "assets/comedy.png",
        "time": "10:00 PM",
        "rating": 4.5
      },
      {
        "title": "The Mask",
        "image": "assets/comedy.png",
        "time": "10:00 PM",
        "rating": 4.5
      },
      {
        "title": "The Mask",
        "image": "assets/comedy.png",
        "time": "10:00 PM",
        "rating": 4.5
      },
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
          'Movies in ',
          style: TextStyle(color: AppColors.grey50),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondry,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(
              title: movie["title"] as String,
              imagePath: movie["image"] as String,
              time: movie["time"] as String,
              rating: movie["rating"] as double,
              onBook: () {
                Get.to(() => const ReservationPage());
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
