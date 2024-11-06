import 'package:flutter/material.dart';

class AppColors {
  // hex Color
  static Color primaryColor = const Color(0xffe21b70);
  static Color lightGreyColor = const Color(0xffECEEEF);
  static Color textFieldColor = const Color(0xffF9F9F9);
  static Color facebookColor = const Color(0xff0866ff);
  static Color lightLightGreyColor = const Color.fromARGB(255, 242, 242, 242);

  // Normal Color
  static Color white = Colors.white;
  static Color greyColor = Colors.grey;
  static Color blackColor = Colors.black;

  //Grediant Color
  static LinearGradient storyColor = const LinearGradient(colors: [
    Color(0xff6228d7),
    Color(0xffee2a7b),
    Color(0xffee2a7b),
    Color(0xfff9ce34),
    Color(0xfff9ce34),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static LinearGradient metaiConColor = const LinearGradient(colors: [
    Color(0xffee2a7b),
    Color(0xFF000080),
    Color(0xFFADD8E6),
    Color(0xFF000080),
    Color(0xFFADD8E6),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
