import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:stacked/stacked.dart';
import '../../../model/home_post_model.dart';
import '../../../utils/colors/app_colors.dart';
import 'show_picture_viewmodel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ShowPictureViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                    onTap: () {
                      cameraPostData.add(imagePath);
                      viewModel.navigateToNavigationView();
                      viewModel.rebuildUi();
                      print(cameraPostData);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                                text: 'Posted successfuly!',
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                size: 16),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    child: CustomText.customSizedText(
                        text: 'Post', fontWeight: FontWeight.w900)),
              )
            ],
          ),
          body: Image.file(File(imagePath)),
        );
      },
    );
  }
}
