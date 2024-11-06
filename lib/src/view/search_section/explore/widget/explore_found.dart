import 'package:flutter/material.dart';
import 'package:instagram/src/model/home_post_model.dart';
import 'package:instagram/src/view/search_section/explore/explore_viewmodel.dart';
import '../../../../reuseable_widget/custom_text.dart';
import '../../../../utils/colors/app_colors.dart';

Widget exploreFound(
    {required ExploreViewModel viewModel, required HomePostModel model}) {
  return viewModel.foundUsers.isNotEmpty
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: viewModel.foundUsers.length,
            //  model.data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: GestureDetector(
                  onTap: () => viewModel.navigateToUserProfileView(
                    userName: viewModel.foundUsers[index]['name'],
                    // model.data[index].userName,
                    userImage: model.data[index].profilePicture,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    model.data[index].profilePicture),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.customSizedText(
                                    text: model.data[index].userName, size: 14),
                                CustomText.customSizedText(
                                    text: 'Hello',
                                    color: AppColors.greyColor,
                                    size: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => viewModel.navigateToCameraView(),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.greyColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      : Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
              child: CustomText.customSizedText(
            text: 'User not found',
          )),
        );
}
