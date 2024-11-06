import 'package:flutter/material.dart';

Widget circularProfile(
        {required double height,
        required double width,
        required String imageUrl}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
