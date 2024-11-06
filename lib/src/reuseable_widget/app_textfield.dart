import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import 'text_style.dart';

class CustomTextFields {
  static Widget textfield({
    required controller,
    String? hintText,
    double? height,
    Icon? prefixIcon,
    Icon? suffixIcon,
    Color? iconColor,
  }) {
    return SizedBox(
      height: height ?? 50,
      child: TextField(
        cursorColor: AppColors.blackColor,
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: AppTextStyle.customTextStyle(
            color: AppColors.greyColor,
          ),
          fillColor: AppColors.textFieldColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: iconColor ?? Colors.white,
          prefixIcon: prefixIcon,
          prefixIconColor: iconColor ?? Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  static Widget aAppTextField(
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
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: AppColors.white,
        textInputAction: textInputAction,
        textAlign: TextAlign.start,
        keyboardType: keBoardType,
        readOnly: readOnly,
        onTap: onPressed,
        initialValue: initialValue,
        cursorWidth: 1,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText!,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
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
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(30.0),
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

  static Widget appTextField({
    controller,
    onPressed,
    prefixIcon,
    double? height,
    Color? borderColor,
    width,
    hintText,
    validator,
    initialValue,
    obscureText = false,
    suffixIcon,
    onSuffixPressed,
    readOnly = false,
    onChanged,
    keBoardType,
    textInputAction,
    Color? hintTColor,
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
        cursorColor: AppColors.white,
        cursorWidth: 0.5,
        textInputAction: textInputAction,
        textAlign: TextAlign.start,
        keyboardType: keBoardType,
        readOnly: readOnly,
        onTap: onPressed,
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText!,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
          hintText: hintText,
          labelStyle: const TextStyle(fontSize: 10.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 2, right: 10),
            child: prefixIcon,
          ),
          suffixIcon: InkWell(
            onTap: onSuffixPressed,
            child: suffixIcon,
          ),
          filled: true,
          alignLabelWithHint: true,
          fillColor: const Color.fromARGB(255, 39, 39, 39),
          hintStyle: TextStyle(
            height: 0,
            color: hintTColor ?? const Color.fromARGB(221, 173, 173, 173),
          ),
        ),
      ),
    );
  }

  static Widget squareTextField(
      {required controller,
      required String hintText,
      void Function(String)? onChanged,
      void Function()? onTap,
      TextInputType? keyBoardType,
      BorderRadius? borderRadius,
      String? Function(String?)? validator,
      Color? borderColor,
      TextStyle? hintStyle,
      Widget? suffixIcon,
      bool? autocorrect,
      bool? fillColor,
      int? maxLines,
      obscureText = false,
      Icon? prefixIcon,
      EdgeInsetsGeometry? contentPadding,
      Color? hintColor,
      FontWeight? hintWeight,
      TextInputAction? textInputAction,
      bool? readOnly,
      BorderStyle? borderStyle,
      autovalidateMode}) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: autovalidateMode,
      style: TextStyle(color: AppColors.white),
      validator: validator,
      obscureText: obscureText!,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: keyBoardType,
      cursorColor: AppColors.white,
      maxLines: maxLines ?? 1,
      autocorrect: autocorrect ?? false,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        fillColor: AppColors.greyColor.withOpacity(0.3),
        filled: fillColor ?? false,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.customTextStyle(
          color: hintColor ?? AppColors.greyColor,
          fontWeight: hintWeight ?? FontWeight.normal,
          size: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
