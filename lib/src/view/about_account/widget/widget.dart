import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import '../../../reuseable_widget/custom_text.dart';

Widget aboutAccListTile({
  required Widget leading,
  required String title,
  required String subtitle,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 15),
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      color: AppColors.white,
      minFontSize: 15,
      maxFontSize: 15,
    ),
    subtitle: CustomText.customSizedText(
      text: subtitle,
      size: 12,
      color: AppColors.greyColor,
      minFontSize: 12,
      maxFontSize: 12,
    ),
  );
}
