import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static customTextStyle({
    double? size,
    FontWeight? fontWeight,
    Color? color,
    TextStyle? textStyle,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
      textStyle: textStyle,
    );
  }

  static instaTextStyle({
    double? size,
    FontWeight? fontWeight,
    Color? color,
    TextStyle? textStyle,
  }) {
    return GoogleFonts.sevillana(
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.white,
      textStyle: textStyle,
    );
  }
}
