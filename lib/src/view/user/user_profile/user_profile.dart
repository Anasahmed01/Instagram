// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/home/widget/widget.dart';
import 'package:instagram/src/view/user/user_profile/user_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/colors/app_colors.dart';
import 'widget/user_profile_tabs.dart';
import 'widget/widget.dart';

class UserProfileView extends StatelessWidget {
  final String userName;
  final String userImage;
  const UserProfileView(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getPost(),
      viewModelBuilder: () => UserProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 45,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: const Icon(Icons.arrow_back)),
            ),
            title: CustomText.customSizedText(
                text: userName, size: 18, fontWeight: FontWeight.w600),
            actions: [
              GestureDetector(
                onTap: () => bottomSheetX(
                  context,
                  UserProfBottomSheet(
                    userName: userName,
                    userImage: userImage,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          body: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(userImage),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            CustomText.customSizedText(
                                text: '6',
                                size: 16,
                                fontWeight: FontWeight.w600),
                            CustomText.customSizedText(text: 'posts')
                          ],
                        ),
                        Column(
                          children: [
                            CustomText.customSizedText(
                                text: '256k',
                                size: 16,
                                fontWeight: FontWeight.w600),
                            CustomText.customSizedText(text: 'followers')
                          ],
                        ),
                        Column(
                          children: [
                            CustomText.customSizedText(
                                text: '425',
                                size: 16,
                                fontWeight: FontWeight.w600),
                            CustomText.customSizedText(text: 'following')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                            text: userName, fontWeight: FontWeight.w500),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                            text: 'Discription', fontWeight: FontWeight.w500),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        viewModel.isFollowed == true
                            ? Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.isFollowed =
                                        !viewModel.isFollowed;
                                    viewModel.rebuildUi();
                                  },
                                  child: socialButton(
                                    height: 35,
                                    name: 'Following',
                                    color: Color.fromARGB(221, 53, 52, 52),
                                  ),
                                ),
                              )
                            : Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.isFollowed =
                                        !viewModel.isFollowed;
                                    viewModel.rebuildUi();
                                  },
                                  child: socialButton(
                                    height: 35,
                                    name: 'Follow',
                                    color: Colors.blue.shade400,
                                  ),
                                ),
                              ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToChatView(
                                  userImage: userImage, userName: userName);
                            },
                            child: socialButton(
                              height: 35,
                              name: 'Message',
                              color: const Color.fromARGB(221, 53, 52, 52),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                      "https://mail.google.com/mail/u/0/?hl=en/#inbox?compose=new"),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: socialButton(
                              height: 35,
                              name: 'Email',
                              color: const Color.fromARGB(221, 53, 52, 52),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.getpostData!.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => viewModel.navigateToStoryView(
                              userImage: userImage, userName: userName),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(2.5),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(66, 179, 177, 177),
                                shape: BoxShape.circle),
                            height: 80,
                            width: 80,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 5, color: AppColors.blackColor),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(viewModel
                                      .getpostData!.data[index].profilePicture),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TabBar(
                    tabs: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.view_column_outlined,
                          color: AppColors.white,
                          weight: 200,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage(AppImages.reel),
                          size: 25,
                          color: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person_pin_outlined,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    ],
                    indicatorColor: AppColors.white,
                    indicatorWeight: 1,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: TabBarView(
                      children: [
                        UserProfileTabs.postView(viewModel: viewModel),
                        UserProfileTabs.reelView(viewModel: viewModel),
                        UserProfileTabs.tagView(),
                      ],
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
