import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import 'custom_text.dart';

class AppButtons {
  static Widget appButton(
      {required Function()? ontap,
      required BuildContext context,
      required String title,
      double? size,
      fontWeight}) {
    return InkWell(
      onTap: ontap,
      splashColor: Colors.transparent,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue[500]),
        child: Center(
          child: CustomText.customSizedText(
              size: size ?? 14,
              text: title,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: AppColors.white),
        ),
      ),
    );
  }
}
