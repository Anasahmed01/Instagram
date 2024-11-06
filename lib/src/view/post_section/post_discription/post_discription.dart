import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/app_buttons.dart';
import 'package:instagram/src/reuseable_widget/app_divider.dart';
import 'package:instagram/src/view/post_section/post_discription/post_discription_viewmodel.dart';
import 'package:instagram/src/view/post_section/post_discription/widget/widget.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';

class PostDiscriptionView extends StatelessWidget {
  final File postImage;
  final String cameraImage;
  const PostDiscriptionView(
      {super.key, required this.postImage, required this.cameraImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      // onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => PostDiscriptionViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => viewModel.navigateToBack(),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
            title: CustomText.customSizedText(
              text: 'New Post',
              maxFontSize: 18,
              minFontSize: 18,
              size: 18,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.justify,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  cameraImage != ''
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 300,
                          width: double.infinity,
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image: FileImage(
                          //       postImage,
                          //     ),
                          //   ),
                          // ),
                          child: Image.file(
                            File(cameraImage),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                postImage,
                              ),
                            ),
                          ),
                        ),
                  postTextField(
                      hintText: 'Write a caption or add a poll...',
                      controller: viewModel.controller),
                  const SizedBox(
                    height: 30,
                  ),
                  appDivider(
                    thickness: 1,
                    color: const Color.fromARGB(221, 53, 52, 52),
                  ),
                  postListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Add location'),
                  postListTile(
                      leading: Icon(
                        CupertinoIcons.person,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Tag people'),
                  postListTile(
                      leading: Icon(
                        CupertinoIcons.double_music_note,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Add music'),
                  postListTile(
                      leading: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Audience'),
                  postListTile(
                      leading: Icon(
                        Icons.calendar_month_outlined,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Add reminder'),
                  postListTile(
                      leading: Icon(
                        CupertinoIcons.graph_circle,
                        size: 28,
                        color: AppColors.white,
                      ),
                      title: 'Boost post'),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 55,
            child: AppButtons.appButton(
              ontap: () {
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
                          text: 'Posted successfuly!',
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          size: 16,
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
                cameraImage != ''
                    ? viewModel.addToCameraPostData(cameraPost: cameraImage)
                    : viewModel.addToPostData(postImage: postImage);
                viewModel.rebuildUi();
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
                          text: 'Posted successfuly!',
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          size: 16,
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              context: context,
              title: 'Share',
            ),
          ),
        );
      },
    );
  }
}
