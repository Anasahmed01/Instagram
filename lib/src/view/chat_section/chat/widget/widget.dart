import 'package:flutter/material.dart';
import 'package:instagram/src/view/chat_section/chat/chat_viewmodel.dart';
import '../../../../utils/colors/app_colors.dart';

Widget chatTextField({
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
  required ChatViewModel viewModel,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      cursorColor: AppColors.white,
      cursorWidth: 0.5,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      readOnly: readOnly,
      onTap: onPressed,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText!,
      focusNode: viewModel.focusNode,
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
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
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
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 48, 48, 48),
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 48, 48, 48),
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        alignLabelWithHint: true,
        fillColor: const Color.fromARGB(255, 39, 39, 39),
        hintStyle: const TextStyle(
          height: 0,
          color: Color.fromARGB(221, 173, 173, 173),
        ),
      ),
    ),
  );
}
