import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors/app_colors.dart';

Widget cusForExpAppTextField(
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
    suffixIcon,
    onSuffixPressed,
    readOnly = false,
    onChanged,
    keBoardType,
    focusNode,
    autofocus = false,
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
      autofocus: autofocus,
      focusNode: focusNode,
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.facebookColor,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              CupertinoIcons.paperplane_fill,
              color: AppColors.white,
            ),
          ),
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
