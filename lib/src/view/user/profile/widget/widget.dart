import 'package:flutter/material.dart';
import '../../../../utils/colors/app_colors.dart';

Widget storyProfileContainer({required String image}) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
            gradient: AppColors.storyColor, shape: BoxShape.circle),
        height: 90,
        width: 90,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: AppColors.blackColor),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 6,
        right: 3,
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.blue.shade500,
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: AppColors.blackColor),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    ],
  );
}
