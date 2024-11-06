import 'package:flutter/material.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

Widget drawerListTile({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      minFontSize: 15,
      maxFontSize: 15,
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: color ?? AppColors.greyColor,
    ),
  );
}

Widget drawerTextField(
    {controller,
    onPressed,
    prefixIcon,
    double? height,
    Color? borderColor,
    Color? prefixIconColor,
    Color? hintTColor,
    width,
    hintText,
    validator,
    initialValue,
    obscureText = false,
    IconData? suffixIcon,
    onSuffixPressed,
    readOnly = false,
    onChanged,
    keBoardType,
    TextInputAction? textInputAction}) {
  //final bool suffixTapped;
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: borderColor ?? Colors.transparent,
      ),
    ),
    child: TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: AppColors.greyColor,
      textInputAction: textInputAction,
      textAlign: TextAlign.start,
      keyboardType: keBoardType,
      readOnly: readOnly,
      onTap: onPressed,
      initialValue: initialValue,
      cursorWidth: 2,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText!,
      style: TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        errorStyle: const TextStyle(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 10.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Icon(
            prefixIcon,
            size: 25.0,
            color: prefixIconColor,
          ),
        ),
        suffixIcon: InkWell(
          onTap: onSuffixPressed,
          child: Icon(suffixIcon, color: AppColors.greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        alignLabelWithHint: true,
        fillColor: const Color.fromARGB(255, 39, 39, 39),
        hintStyle: TextStyle(
          height: 1,
          color: hintTColor ?? const Color.fromARGB(221, 173, 173, 173),
        ),
      ),
    ),
  );
}
