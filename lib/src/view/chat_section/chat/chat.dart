import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/circuler_container.dart';
import '../../../reuseable_widget/custom_text.dart';
import '../../../reuseable_widget/toole_tip.dart';
import 'chat_viewmodel.dart';
import 'widget/chat_bubble.dart';
import 'widget/widget.dart';

class ChatView extends StatelessWidget {
  final String userImage;
  final String userName;
  const ChatView({super.key, required this.userImage, required this.userName});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => ChatViewModel(),
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
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(userImage),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                          text: userName,
                          size: 16,
                          minFontSize: 16,
                          fontWeight: FontWeight.w400),
                      CustomText.customSizedText(
                          text: 'Active 25m ago',
                          size: 12,
                          minFontSize: 12,
                          color: AppColors.greyColor),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              popUp(
                popUpIcon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    CupertinoIcons.phone,
                    size: 25,
                  ),
                ),
              ),
              popUp(
                popUpIcon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    CupertinoIcons.video_camera,
                    size: 40,
                  ),
                ),
              ),
              popUp(
                popUpIcon: const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    CupertinoIcons.tags,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    circularProfile(
                        height: 100, width: 100, imageUrl: userImage),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomText.customSizedText(
                          text: userName,
                          size: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    CustomText.customSizedText(
                      text: 'Instagram  -  $userName',
                    ),
                    CustomText.customSizedText(
                        text: '1 M followers  -  6 post',
                        color: AppColors.greyColor),
                    CustomText.customSizedText(
                        text: 'You follow each orther on instagram',
                        color: AppColors.greyColor),
                    CustomText.customSizedText(
                        text: 'You both follow meiraj and 2 others',
                        color: AppColors.greyColor),
                    GestureDetector(
                      onTap: () => viewModel.navigateToUserProfileView(
                          userImage: userImage, userName: userName),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 30),
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 36, 36, 36)),
                        child: CustomText.customSizedText(
                            text: 'View Profile', fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: viewModel.isScrolled == true
                      ? viewModel.chats.length + 1
                      : viewModel.chats.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        text: viewModel.chats[index],
                        isCurrentUser: viewModel.isChat);
                  },
                ),
                const SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: chatTextField(
              controller: viewModel.controller,
              viewModel: viewModel,
              prefixIcon: GestureDetector(
                onTap: () => viewModel.navigateToCameraView(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    CupertinoIcons.camera_fill,
                    size: 22,
                    color: AppColors.white,
                  ),
                ),
              ),
              hintText: 'Message...',
              suffixIcon: viewModel.isFocus == false
                  ? Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.mic,
                            color: AppColors.white,
                            size: 26,
                          ),
                          Icon(
                            Icons.photo_outlined,
                            color: AppColors.white,
                            size: 26,
                          ),
                          Icon(
                            CupertinoIcons.add_circled,
                            color: AppColors.white,
                            size: 26,
                          )
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        viewModel.chats.add(viewModel.controller.text);
                        viewModel.controller.clear();
                        viewModel.rebuildUi();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 15,
                          top: 12,
                        ),
                        child: CustomText.customSizedText(
                            text: 'Send',
                            color: Colors.blue,
                            size: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
