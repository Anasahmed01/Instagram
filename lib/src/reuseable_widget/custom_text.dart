import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'text_style.dart';

class CustomText {
  static Widget customSizedText({
    required String text,
    Color? color,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? textAlign,
    double? size,
    FontWeight? fontWeight,
    double? minFontSize,
    double? maxFontSize,
    bool? softWrap,
  }) {
    return AutoSizeText(
      softWrap: softWrap,
      text,
      maxLines: maxLine ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.justify,
      textDirection: TextDirection.ltr,
      minFontSize: minFontSize ?? 8,
      maxFontSize: maxFontSize ?? 34,
      style: AppTextStyle.customTextStyle(
        size: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.white,
      ),
    );
  }

  static Widget errorText(
      {required String errorText, required bool visible, double? leftPadding}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Visibility(
          visible: visible,
          child: customSizedText(
            text: errorText,
            color: Colors.red,
            size: 12,
            maxFontSize: 12,
          ),
        ),
      ),
    );
  }
}

String dummyText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
