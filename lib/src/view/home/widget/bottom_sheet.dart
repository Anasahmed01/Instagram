import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/app_divider.dart';
import 'package:instagram/src/reuseable_widget/app_textfield.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/reuseable_widget/toole_tip.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/home/home_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/colors/app_colors.dart';
import 'widget.dart';
import 'dart:math' as math;

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getPost();
      },
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          height: MediaQuery.sizeOf(context).height * 0.8,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  CustomText.customSizedText(
                      text: 'Comments', fontWeight: FontWeight.w500, size: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child:
                        appDivider(thickness: 0.5, color: Colors.grey.shade800),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.comments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    viewModel.navigateToUserProfileView(
                                        userName: viewModel
                                            .getpostData!.data[0].userName,
                                        userImage: viewModel.getpostData!
                                            .data[0].profilePicture);
                                  },
                                  child: GestureDetector(
                                    onTap: () => viewModel.navigateToStoryView(
                                        personImage: viewModel.getpostData!
                                            .data[0].profilePicture,
                                        personName: viewModel
                                            .getpostData!.data[0].userName),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          gradient: AppColors.storyColor,
                                          shape: BoxShape.circle),
                                      height: 60,
                                      width: 60,
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3,
                                              color: AppColors.blackColor),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(viewModel
                                                .getpostData!
                                                .data[0]
                                                .profilePicture),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      title: GestureDetector(
                                        onTap: () {
                                          viewModel.navigateToUserProfileView(
                                              userName: viewModel.getpostData!
                                                  .data[0].userName,
                                              userImage: viewModel.getpostData!
                                                  .data[0].profilePicture);
                                        },
                                        child: Row(
                                          children: [
                                            CustomText.customSizedText(
                                                text: viewModel.getpostData!
                                                    .data[0].userName,
                                                fontWeight: FontWeight.w500,
                                                size: 12),
                                            CustomText.customSizedText(
                                                text:
                                                    '    ${viewModel.timeNow.minute} min',
                                                color: AppColors.greyColor,
                                                size: 12),
                                          ],
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: CustomText.customSizedText(
                                                text:
                                                    viewModel.comments[index]),
                                          ),
                                          CustomText.customSizedText(
                                              text:
                                                  'Reply        See translation',
                                              maxLine: 10,
                                              color: AppColors.greyColor),
                                        ],
                                      ),
                                      trailing: const LikedPCount(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        likeQuantity: '',
                                        iconSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 39, 39, 39),
                child: CustomTextFields.appTextField(
                    controller: viewModel.controller,
                    textInputAction: TextInputAction.newline,
                    hintText: 'Add a comment...',
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AppImages.me),
                              fit: BoxFit.cover)),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => viewModel.addComment(),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.send,
                          color: AppColors.greyColor,
                          size: 30,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PostBottomSheet extends StatelessWidget {
  final String userName;
  final String userImage;
  const PostBottomSheet(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          height: 330,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child:
                        appDivider(thickness: 0.5, color: Colors.grey.shade800),
                  ),
                  homeListTile(
                      onTab: () => Share.share(
                            'https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA==',
                          ),
                      leading: Transform.rotate(
                        angle: 382 * math.pi / 180,
                        child: Icon(
                          CupertinoIcons.paperplane,
                          color: AppColors.white,
                        ),
                      ),
                      title: "We're moving things around!"),
                  homeListTile(
                    onTab: () => viewModel.navigateToAboutAccountView(
                        userName: userName, userImage: userImage),
                    leading: Icon(
                      CupertinoIcons.person_circle,
                      color: AppColors.white,
                    ),
                    title: 'About this account',
                  ),
                  homeListTile(
                      onTab: () => bottomSheetX(
                          context,
                          WhySeeingPostBottomSheet(
                              userName: userName, userImage: userImage)),
                      leading: Icon(
                        CupertinoIcons.info_circle,
                        color: AppColors.white,
                      ),
                      title: "Why you're seeing this post"),
                  popUp(
                    popUpIcon: homeListTile(
                      // onTab: () => Navigator.pop(context),
                      leading: const Icon(
                        CupertinoIcons.eye_slash,
                        color: Colors.red,
                      ),
                      title: 'Hide',
                      color: Colors.red,
                    ),
                  ),
                  popUp(
                    popUpIcon: homeListTile(
                      // onTab: () => Navigator.pop(context),
                      leading: const Icon(
                        CupertinoIcons.exclamationmark_bubble,
                        color: Colors.red,
                      ),

                      title: 'Report',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class WhySeeingPostBottomSheet extends StatelessWidget {
  final String userName;
  final String userImage;
  const WhySeeingPostBottomSheet(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          height: 420,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  CustomText.customSizedText(
                      text: "Why you're seeing this post",
                      color: AppColors.white,
                      size: 18,
                      fontWeight: FontWeight.w500),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child:
                        appDivider(thickness: 0.5, color: Colors.grey.shade800),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45.0, vertical: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Posts are shown in feed based on many things, including your activity across instagram and Threads. ',
                            style: TextStyle(
                              color: AppColors.greyColor,
                            )),
                        TextSpan(
                          text: 'Learn more',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(
                                  Uri.parse(
                                      "https://help.instagram.com/1731078377046291"),
                                  mode: LaunchMode.externalApplication);
                            },
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15),
                      onTap: () {},
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          height: 45,
                          width: 45,
                          userImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: CustomText.customSizedText(
                          text: 'You follow $userName',
                          size: 14,
                          color: AppColors.white,
                          minFontSize: 14,
                          maxFontSize: 14,
                          maxLine: 2),
                    ),
                  ),
                  homeListTileWhySeeingPostBottomSheet(
                    onTab: () => viewModel.navigateToAboutAccountView(
                        userName: userName, userImage: userImage),
                    leading: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.white,
                    ),
                    title: "You've followed $userName for 1 year",
                  ),
                  homeListTileWhySeeingPostBottomSheet(
                      onTab: () {},
                      leading: Icon(
                        CupertinoIcons.heart,
                        color: AppColors.white,
                      ),
                      title:
                          "you like posts from $userName more than other accounts you follow"),
                  homeListTileWhySeeingPostBottomSheet(
                      onTab: () => Navigator.pop(context),
                      leading: Icon(
                        CupertinoIcons.heart,
                        color: AppColors.white,
                      ),
                      title: 'This post is liked more than other in your feed'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
