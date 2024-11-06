import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import '../../../../utils/colors/app_colors.dart';
import '../user_profile_viewmodel.dart';

class UserProfileTabs {
  static Widget postView({required UserProfileViewModel viewModel}) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: viewModel.getpostData!.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            viewModel.navigateToExploreImageView(
                userImage: viewModel.getpostData!.data[index].profilePicture,
                userName: viewModel.getpostData!.data[index].userName);
          },
          child: Image.asset(
            viewModel.getpostData!.data[index].profilePicture,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  static Widget reelView({required UserProfileViewModel viewModel}) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: viewModel.getpostData!.data.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (BuildContext context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
            image:
                AssetImage(viewModel.getpostData!.data[index].profilePicture),
            fit: BoxFit.cover,
          )),
          child: Row(
            children: [
              const Icon(Icons.play_arrow_rounded),
              CustomText.customSizedText(text: '17'),
            ],
          ),
        );
      },
    );
  }

  static Widget tagView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.blackColor,
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 5),
            ),
            child: const Icon(
              Icons.person_pin_outlined,
              size: 70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText.customSizedText(
              text: 'Photos and\n videos of you',
              maxLine: 2,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              size: 22),
          const SizedBox(
            height: 20,
          ),
          CustomText.customSizedText(
              color: AppColors.greyColor,
              textAlign: TextAlign.center,
              size: 14,
              text:
                  "When people tag you in photos\n and videos, thay'll appear here.",
              maxLine: 2),
        ],
      ),
    );
  }
}
