import 'package:flutter/material.dart';
import '../../../../reuseable_widget/custom_text.dart';
import '../../../../utils/colors/app_colors.dart';

Widget postTextField({
  controller,
  double? height,
  width,
  hintText,
}) {
  //final bool suffixTapped;
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 100,
      cursorColor: AppColors.white,
      cursorWidth: 0.5,
      textInputAction: TextInputAction.newline,
      textAlign: TextAlign.start,
      controller: controller,
      style: TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        errorStyle: const TextStyle(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.red)),
        // contentPadding:
        //     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
        hintText: hintText,
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyle(
            color: AppColors.white.withOpacity(0.8),
            fontWeight: FontWeight.w400),
        labelStyle: const TextStyle(fontSize: 10.0),
        filled: true,
        alignLabelWithHint: true,
        fillColor: AppColors.blackColor,
      ),
    ),
  );
}

Widget postListTile({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(3),
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 16,
      minFontSize: 16,
      maxFontSize: 16,
      color: color ?? AppColors.white,
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: color ?? AppColors.white.withOpacity(0.8),
    ),
  );
}
