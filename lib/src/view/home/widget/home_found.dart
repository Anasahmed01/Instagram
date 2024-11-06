import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/src/model/home_post_model.dart';
import 'package:instagram/src/model/home_story_model.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/view/home/home_viewmodel.dart';
import '../../../reuseable_widget/custom_text.dart';
import 'bottom_sheet.dart';
import 'sub_widget/like.dart';
import 'widget.dart';

Widget homeFound({
  required HomeStoryModel model,
  required HomePostModel postModel,
  required HomeViewModel viewModel,
}) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 118,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: model.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => viewModel.navigateToStoryView(
                    personName: model.data[index].userName,
                    personImage: model.data[index].profilePicture,
                  ),
                  child: storyContainer(
                      image: model.data[index].profilePicture,
                      position: index + 1),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomText.customSizedText(
                      text: model.data[index].userName, size: 12),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cameraPostData.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            //height: MediaQuery.sizeOf(context).height / 1.3,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => viewModel.navigateToUserProfileView(
                      userName: postModel.data[0].userName,
                      userImage: postModel.data[0].profilePicture),
                  child: Card(
                    color: AppColors.blackColor,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        postModel.data[0].profilePicture),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.customSizedText(
                                    text: postModel.data[0].userName,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText.customSizedText(
                                    text: 'Your post',
                                    size: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            // onTap: () =>
                            //     bottomSheetX(context, const PostBottomSheet()),
                            child: Icon(
                              Icons.more_vert_outlined,
                              size: 24,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PostOfList(
                  discription: cameraPostData[index]['postDiscription'],
                  index: index,
                  postImage: FileImage(
                    File(
                      cameraPostData[index]['postImage'],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // if (postData.isEmpty)
      //   Center(
      //     heightFactor: 4,
      //     child: Column(
      //       children: [
      //         const Icon(
      //           Icons.image_not_supported_outlined,
      //           size: 80,
      //         ),
      //         CustomText.customSizedText(
      //             text: 'Post not found',
      //             size: 18,
      //             fontWeight: FontWeight.w500),
      //       ],
      //     ),
      //   ),
      ListView.builder(
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: postData.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            //height: MediaQuery.sizeOf(context).height / 1.3,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => viewModel.navigateToUserProfileView(
                    userName: postModel.data[0].userName,
                    userImage: postModel.data[0].profilePicture,
                  ),
                  child: Card(
                    color: AppColors.blackColor,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        postModel.data[0].profilePicture),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText.customSizedText(
                                    text: postModel.data[0].userName,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText.customSizedText(
                                    text: 'Your post',
                                    size: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            // onTap: () =>
                            //     bottomSheetX(context, const PostBottomSheet()),
                            child: Icon(
                              Icons.more_vert_outlined,
                              size: 24,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PostOfList(
                  discription: postData[index]['postDiscription'],
                  index: index,
                  postImage: FileImage(postData[index]['postImage']),
                )
              ],
            ),
          );
        },
      ),
      ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              //height: MediaQuery.sizeOf(context).height / 1.3,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => viewModel.navigateToUserProfileView(
                        userName: postModel.data[index].userName,
                        userImage: postModel.data[index].profilePicture),
                    child: Card(
                      color: AppColors.blackColor,
                      child: Container(
                        margin: const EdgeInsets.only(left: 15, right: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          postModel.data[index].profilePicture),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.customSizedText(
                                      text: postModel.data[index].userName,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomText.customSizedText(
                                      text: 'Suggested for you',
                                      size: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () => bottomSheetX(
                                  context,
                                  PostBottomSheet(
                                    userImage: viewModel.getpostData!
                                        .data[index].profilePicture,
                                    userName: viewModel
                                        .getpostData!.data[index].userName,
                                  )),
                              child: Icon(
                                Icons.more_vert_outlined,
                                size: 24,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PostOfList(
                    discription: viewModel.getpostData!.data[index].discription,
                    index: index,
                    postImage:
                        AssetImage(viewModel.getpostData!.data[index].post),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(),
          itemCount: postModel.data.length),
    ],
  );
}

Widget getUserName({required String userName}) {
  return CustomText.customSizedText(
      text: userName, fontWeight: FontWeight.w500, size: 14);
}
