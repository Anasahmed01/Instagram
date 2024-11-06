// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable
// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/animations/heart_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../home_viewmodel.dart';

Widget storyContainer({required int position, required String image}) {
  if (position == 1) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              gradient: AppColors.storyColor, shape: BoxShape.circle),
          height: 85,
          width: 85,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: AppColors.blackColor),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 3,
          child: Container(
            alignment: Alignment.center,
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: AppColors.blackColor),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  } else {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration:
          BoxDecoration(gradient: AppColors.storyColor, shape: BoxShape.circle),
      height: 85,
      width: 85,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 5, color: AppColors.blackColor),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

Future bottomSheetX(BuildContext context, bottomSheetName) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return bottomSheetName;
    },
  );
}

Widget homeListTile({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 15),
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      color: color,
      minFontSize: 15,
      maxFontSize: 15,
    ),
  );
}

Widget homeListTileWhySeeingPostBottomSheet({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: ListTile(
      contentPadding: const EdgeInsets.only(left: 15, right: 15),
      onTap: onTab,
      leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor.withOpacity(0.2)),
              shape: BoxShape.circle),
          child: leading),
      title: CustomText.customSizedText(
          text: title,
          size: 14,
          textAlign: TextAlign.start,
          color: color,
          minFontSize: 14,
          maxFontSize: 14,
          maxLine: 2),
    ),
  );
}

class LikedPCount extends StatelessWidget {
  final double iconSize;
  final String likeQuantity;
  final CrossAxisAlignment? crossAxisAlignment;
  const LikedPCount(
      {super.key,
      required this.iconSize,
      required this.likeQuantity,
      required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return SizedBox(
          width: 45,
          child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            children: [
              viewModel.isLiked == true
                  ? HeartAnimation(
                      isAnimation: viewModel.isLiked,
                      child: GestureDetector(
                        onTap: () {
                          viewModel.isLiked = !viewModel.isLiked;
                          viewModel.decrement();
                          viewModel.rebuildUi();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: iconSize,
                        ),
                      ),
                    )
                  : HeartAnimation(
                      isAnimation: viewModel.isLiked,
                      child: GestureDetector(
                        onTap: () {
                          viewModel.isLiked = !viewModel.isLiked;
                          viewModel.increment();
                          viewModel.rebuildUi();
                        },
                        child: Icon(
                          CupertinoIcons.heart,
                          color: AppColors.white,
                          size: iconSize,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomText.customSizedText(
                    text: '${viewModel.commentCount} $likeQuantity',
                    fontWeight: FontWeight.w500,
                    size: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
