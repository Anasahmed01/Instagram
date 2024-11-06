import 'package:flutter/material.dart';
import 'package:instagram/src/view/user/profile/profile_viewmodel.dart';
import 'package:instagram/src/view/user/profile/widget/widget.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/images.dart';
import '../user_profile/widget/widget.dart';
import 'widget/bottom_sheet.dart';
import 'widget/profile_tabs.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getPost(),
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            leadingWidth: 45,
            automaticallyImplyLeading: false,
            title: CustomText.customSizedText(
                text: "anasahmedyt_official",
                size: 18,
                fontWeight: FontWeight.w600),
            actions: [
              GestureDetector(
                onTap: () => viewModel.navigateToDrawerView(),
                child: const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.menu,
                    size: 34,
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => viewModel.navigateToStoryView(
                                userImage: AppImages.me,
                                userName: 'anasahmedyt_official'),
                            child: storyProfileContainer(image: AppImages.me)),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Anas Ahmed',
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing industry.',
                          style:
                              TextStyle(fontSize: 13, color: AppColors.white),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () => viewModel.navigateToEditProfileView(),
                            child: socialButton(
                              height: 35,
                              name: 'Edit profile',
                              color: const Color.fromARGB(221, 53, 52, 52),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              profileBottomSheet(context);
                            },
                            child: socialButton(
                              height: 35,
                              name: 'Share profile',
                              color: const Color.fromARGB(221, 53, 52, 52),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 112,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.getpostData!.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => viewModel.navigateToStoryView(
                              userImage: viewModel
                                  .getpostData!.data[index].profilePicture,
                              userName:
                                  viewModel.getpostData!.data[index].userName),
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                                      image: AssetImage(viewModel.getpostData!
                                          .data[index].profilePicture),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, bottom: 10),
                                child: CustomText.customSizedText(
                                    text: 'Hightlight', size: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  TabBar(
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.view_column_outlined,
                          color: AppColors.white,
                          weight: 200,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage(AppImages.reel),
                          size: 25,
                          color: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        ProfileTabs.postView(viewModel: viewModel),
                        ProfileTabs.reelView(viewModel: viewModel),
                        ProfileTabs.tagView(),
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
