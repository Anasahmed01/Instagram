// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/src/reuseable_widget/toole_tip.dart';
import 'package:instagram/src/view/search_section/explore/explore_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/animations/heart_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../../home/widget/bottom_sheet.dart';
import '../../home/widget/widget.dart';
import 'dart:math' as math;

class ExploreImageView extends StatelessWidget {
  final String userImage;
  final String userName;
  const ExploreImageView(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.getStory();
      },
      viewModelBuilder: () => ExploreViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText.customSizedText(
                text: 'Explore', fontWeight: FontWeight.w500, size: 18),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 10),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => viewModel.navigateToUserProfileView(
                                userName: userName, userImage: userImage),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(userImage),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.customSizedText(
                                text: userName == ''
                                    ? 'anasahmedyt_oFF'
                                    : userName,
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
                      popUp(
                        popUpIcon: Icon(
                          Icons.more_vert_outlined,
                          size: 24,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    viewModel.chekAlreadyLiked();
                    viewModel.isLiked = true;
                    viewModel.isHeartAnimation = true;
                    viewModel.rebuildUi();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).width,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(userImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: viewModel.isHeartAnimation ? 1 : 0,
                        child: HeartAnimation(
                          isAnimation: viewModel.isHeartAnimation,
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
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17.0, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              viewModel.isLiked
                                  ? HeartAnimation(
                                      isAnimation: viewModel.isLiked,
                                      child: GestureDetector(
                                        onTap: () {
                                          viewModel.isLiked =
                                              !viewModel.isLiked;
                                          viewModel.decrementCounter();
                                          viewModel.rebuildUi();
                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  : HeartAnimation(
                                      isAnimation: viewModel.isLiked,
                                      child: GestureDetector(
                                        onTap: () {
                                          viewModel.isLiked =
                                              !viewModel.isLiked;
                                          viewModel.incrementCounter();
                                          viewModel.rebuildUi();
                                        },
                                        child: const Icon(
                                          Icons.favorite_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () => bottomSheetX(
                                    context, const CommentBottomSheet()),
                                child: const Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Share.share(
                                      'https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA==',
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: 382 * math.pi / 180,
                                    child: const Icon(
                                      CupertinoIcons.paperplane,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          popUp(
                            popUpIcon: const Icon(
                              Icons.bookmark_border_sharp,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      CustomText.customSizedText(
                          text: '${viewModel.likeCount} likes',
                          fontWeight: FontWeight.w500,
                          size: 14),
                      const SizedBox(
                        height: 2,
                      ),
                      Text.rich(
                        TextSpan(
                          text: viewModel.getPostData!.data[0].userName,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  " ${viewModel.getPostData!.data[0].discription}",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
