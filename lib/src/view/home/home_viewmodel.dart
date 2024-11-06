import 'package:flutter/material.dart';
import 'package:instagram/src/model/home_post_model.dart';
import 'package:instagram/src/model/home_story_model.dart';
import 'package:instagram/src/view/chat_section/all_chats/all_chats.dart';
import 'package:instagram/src/view/notifications/notifications.dart';
import 'package:instagram/src/view/story/story.dart';
import 'package:stacked/stacked.dart';
import '../../del_model/del_data.dart';
import 'package:instagram/src/view/user/user_profile/user_profile.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';
import '../about_account/about_account.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  GlobalKey containerKey = GlobalKey();
  bool isHeartAnimation = false;

  addComment() {
    comments.add(controller.text.trim());
    controller.clear();
    rebuildUi();
  }

  int likeCount = 0;

  incrementCounter() {
    likeCount++;
    rebuildUi();
  }

  decrementCounter() {
    likeCount--;
    rebuildUi();
  }

  navigateToUserProfileView({
    required String userName,
    required String userImage,
  }) {
    locator<NavigationService>().navigateWithTransition(
      UserProfileView(
        userName: userName,
        userImage: userImage,
      ),
    );
  }

  navigateToNotificationView() {
    locator<NavigationService>().navigateWithTransition(
      const NotificetionView(),
    );
  }

  navigateToAboutAccountView(
      {required String userName, required String userImage}) {
    locator<NavigationService>().navigateWithTransition(
      AboutAccountView(
        userImage: userImage,
        userName: userName,
      ),
    );
  }

  navigateToStoryView(
      {required String personImage, required String personName}) {
    locator<NavigationService>().navigateWithTransition(
      StoryView(
        personImage: personImage,
        personName: personName,
      ),
    );
  }

  navigateToAllChatsView() {
    locator<NavigationService>().navigateWithTransition(
      const AllChatsView(),
    );
  }

  navigateToBack() {
    locator<NavigationService>().back();
  }

  HomeStoryModel? getStoryData;
  getStory() async {
    try {
      getStoryData = HomeStoryModel.fromJson(HomeDelModel.homeStory);
    } catch (e) {
      print(e);
    }
  }

  HomePostModel? getpostData;
  getPost() async {
    try {
      getpostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }

  List memories = [
    AppImages.me,
    AppImages.bhuvanBam,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.fing,
    AppImages.foodpanda,
  ];

  List postBool = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List comments = [
    'Nice bro🧿♥',
    'where are you from',
    '♥♥♥',
    'good',
    '♥♥♥♥',
    '💎💎'
  ];

  DateTime timeNow = DateTime.now();

  bool isLiked = false;

  bool isCopied = false;

  int commentCount = 0;

  void increment() {
    commentCount++;
  }

  void decrement() {
    commentCount--;
  }
}
