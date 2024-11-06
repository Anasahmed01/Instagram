// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

class EditProfileViewModel extends BaseViewModel {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  File? imagePath;

  gallery(context) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? galleryImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (galleryImage != null) {
      imagePath = File(galleryImage.path);
      rebuildUi();
    } else {
      print('Image is not picked!');
    }
    // imagePath = galleryImage!.path;
    rebuildUi();
    // print(image);
    if (galleryImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey.shade900,
          content: Row(
            children: [
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText.customSizedText(
                text: 'Image is not selected!',
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                size: 16,
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
