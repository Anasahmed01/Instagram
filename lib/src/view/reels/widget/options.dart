// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/reels/reels_viewmodel.dart';
import 'package:marquee/marquee.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/animations/heart_animation.dart';
import '../../home/widget/bottom_sheet.dart';
import '../../home/widget/widget.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReelsViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onDoubleTap: () {
              if (viewModel.isLiked == false) {
                viewModel.isLiked = true;
                viewModel.incrementCounter();
                viewModel.isHeartAnimation = true;
                viewModel.rebuildUi();
              } else {
                viewModel.isHeartAnimation != viewModel.isHeartAnimation;
                viewModel.rebuildUi();
              }
              print('object not found');
            },
            child: Container(
              color: AppColors.facebookColor.withOpacity(0.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 110),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          viewModel.navigateToUserProfileView(
                                              userName: 'flutter_developer02',
                                              userImage: AppImages.fing),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(AppImages.fing),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Flexible(
                                      child: CustomText.customSizedText(
                                          text: 'flutter_developer02',
                                          fontWeight: FontWeight.w500,
                                          size: 15,
                                          maxFontSize: 15,
                                          minFontSize: 15),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.verified, size: 15),
                                    SizedBox(width: 6),
                                    viewModel.isFollowing == true
                                        ? Flexible(
                                            child: GestureDetector(
                                              onTap: () {
                                                viewModel.isFollowing =
                                                    !viewModel.isFollowing;
                                                viewModel.rebuildUi();
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.white)),
                                                child:
                                                    CustomText.customSizedText(
                                                        size: 14,
                                                        minFontSize: 14,
                                                        text: 'Following',
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              viewModel.isFollowing =
                                                  !viewModel.isFollowing;
                                              viewModel.rebuildUi();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppColors.white)),
                                              child: CustomText.customSizedText(
                                                  text: 'Follow',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(width: 6),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: ExpandableText(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                      expandText: 'more',
                                      maxLines: 2,
                                      linkColor: AppColors.greyColor,
                                      animation: true,
                                      collapseOnTextTap: true,
                                      style: TextStyle(color: AppColors.white),
                                      mentionStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white),
                                      urlStyle: TextStyle(
                                        color: AppColors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.blackColor
                                          .withOpacity(0.5)),
                                  width: 150,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Icon(
                                          CupertinoIcons.music_note_2,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        flex: 4,
                                        child: SizedBox(
                                          width: 150,
                                          height: 25,
                                          child: Marquee(
                                            pauseAfterRound:
                                                Duration(seconds: 2),
                                            velocity: 20,
                                            text:
                                                'Original Audio - some music track--',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                viewModel.isLiked == true
                                    ? GestureDetector(
                                        onTap: () {
                                          viewModel.isLiked =
                                              !viewModel.isLiked;
                                          viewModel.rebuildUi();
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          viewModel.isLiked =
                                              !viewModel.isLiked;
                                          viewModel.rebuildUi();
                                        },
                                        child: Icon(
                                          Icons.favorite_outline,
                                          size: 30,
                                        ),
                                      ),
                                SizedBox(height: 10),
                                CustomText.customSizedText(text: '615k'),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () => bottomSheetX(
                                      context, CommentBottomSheet()),
                                  child: Icon(
                                    CupertinoIcons.chat_bubble,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomText.customSizedText(text: '1234 '),
                                SizedBox(height: 30),
                                Transform(
                                  transform: Matrix4.rotationZ(6.4),
                                  child: Icon(
                                    CupertinoIcons.paperplane,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomText.customSizedText(text: '45k'),
                                SizedBox(height: 30),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Opacity(
                      opacity: viewModel.isHeartAnimation ? 1 : 0,
                      child: HeartAnimation(
                        isAnimation: viewModel.isLiked,
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 100,
                        ),
                        duration: const Duration(microseconds: 700),
                        onEnd: () {
                          viewModel.isHeartAnimation = false;
                          viewModel.rebuildUi();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
