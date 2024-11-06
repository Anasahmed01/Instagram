import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/user/user_profile/widget/widget.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../reuseable_widget/view_as.dart';
import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => EditProfileViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: CustomText.customSizedText(
                  text: 'Edit profile', fontWeight: FontWeight.w500, size: 18),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          alignment: Alignment.center,
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                          child: viewModel.imagePath == null
                              ? Image.asset(
                                  height: double.infinity,
                                  AppImages.me,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  height: double.infinity,
                                  viewModel.imagePath!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => viewModel.gallery(context),
                      child: Center(
                        child: CustomText.customSizedText(
                          text: 'Edit picture',
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText.customSizedText(
                        text: 'Name', color: AppColors.greyColor, size: 12),
                    TextField(
                      style: TextStyle(color: AppColors.white),
                      cursorColor: AppColors.white,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.white, width: 2),
                        ),
                        hintText: 'Anas Ahmed',
                        hintStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText.customSizedText(
                        text: 'Username', color: AppColors.greyColor, size: 12),
                    TextField(
                      style: TextStyle(color: AppColors.white),
                      cursorColor: AppColors.white,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.white, width: 2),
                        ),
                        hintText: 'anasahmedyt_official',
                        hintStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText.customSizedText(
                        text: 'Pronouns', color: AppColors.greyColor, size: 12),
                    TextField(
                      style: TextStyle(color: AppColors.white),
                      cursorColor: AppColors.white,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.white, width: 2),
                        ),
                        hintText: 'Anas',
                        hintStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText.customSizedText(
                        text: 'Bio', color: AppColors.greyColor, size: 12),
                    TextField(
                      style: TextStyle(color: AppColors.white),
                      cursorColor: AppColors.white,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.white, width: 2),
                        ),
                        hintText: 'Flutter Developer',
                        hintStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText.customSizedText(
                        text: 'Gender', color: AppColors.greyColor, size: 12),
                    viewAsDropDown(viewModel: viewModel),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.grey.shade900,
                              content: CustomText.customSizedText(
                                  text: 'Profile save successfuly!',
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  size: 16),
                              duration: const Duration(seconds: 2),
                            ));
                          },
                          child: socialButton(
                              name: 'Save',
                              color: Colors.blue.shade400,
                              height: 50,
                              size: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
