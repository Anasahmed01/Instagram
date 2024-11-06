// ignore_for_file: sort_child_properties_last, prefer_typing_uninitialized_variables

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/animations/heart_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../../home/widget/bottom_sheet.dart';
import '../../home/widget/widget.dart';
import '../../search_section/explore/explore_viewmodel.dart';

class FavouriteOfList extends StatelessWidget {
  final void Function()? onTap;
  final int index;
  final postImage;
  final String discription;
  const FavouriteOfList({
    super.key,
    required this.index,
    required this.postImage,
    this.onTap,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ExploreViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.getPost();
        },
        builder: (context, viewModel, child) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
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
                            image: postImage,
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
                      ),
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
                          GestureDetector(
                              onTap: onTap,
                              child: const Icon(CupertinoIcons.bookmark_fill))
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
                      ExpandableText(
                        discription,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                        prefixText: viewModel.getpostData!.data[index].userName,
                        prefixStyle: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                        animation: true,
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 1,
                        linkColor: const Color.fromARGB(255, 117, 117, 117),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
