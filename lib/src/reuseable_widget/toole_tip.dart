import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/text_style.dart';
import '../utils/colors/app_colors.dart';

Widget popUp({required Widget popUpIcon}) {
  return Tooltip(
    decoration: BoxDecoration(
      color: AppColors.greyColor,
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.only(left: 50, bottom: 200),
    textAlign: TextAlign.left,
    padding: const EdgeInsets.all(20),
    showDuration: const Duration(milliseconds: 3500),
    triggerMode: TooltipTriggerMode.tap,
    preferBelow: true,
    textStyle: AppTextStyle.customTextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    message: 'Comming soon.',
    child: popUpIcon,
  );
}
