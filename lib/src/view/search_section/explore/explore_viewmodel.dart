import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../del_model/del_data.dart';
import '../../../model/home_post_model.dart';
import '../../../app/app.locator.dart';
import '../../camera_section/camera.dart';
import '../../user/user_profile/user_profile.dart';
import 'explore.dart';

class ExploreViewModel extends BaseViewModel {
  GlobalKey containerKey = GlobalKey();

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

  navigateToExploreView() {
    locator<NavigationService>().navigateWithTransition(
      const ExploreView(),
    );
  }

  navigateToCameraView() {
    locator<NavigationService>().navigateWithTransition(
      const CameraView(),
    );
  }

  HomePostModel? getPostData;
  getStory() async {
    try {
      getPostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }

  final List<Map<String, dynamic>> allUsers = [
    {"id": 1, "name": "anasahmedyt_official", "age": 29},
    {"id": 2, "name": "bhuvanbam", "age": 40},
    {"id": 3, "name": "talhaanjum", "age": 5},
    {"id": 4, "name": "talhahyunus", "age": 35},
    {"id": 5, "name": "fing", "age": 21},
    {"id": 6, "name": "foodpanda", "age": 55},
  ];

  List<Map<String, dynamic>> foundUsers = [];

  init() {
    foundUsers = allUsers;
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allUsers;
    } else {
      results = allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    foundUsers = results;
    rebuildUi();
  }

  bool isLiked = false;
  bool isHeartAnimation = false;
  bool initFunc = false;
  int likeCount = 0;

  incrementCounter() {
    if (likeCount <= 1) {
      likeCount++;
      rebuildUi();
    }
  }

  decrementCounter() {
    if (likeCount >= 1) {
      likeCount--;
      rebuildUi();
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

  bool alreadyLiked = false;

  void chekAlreadyLiked() {
    if (!alreadyLiked) {
      alreadyLiked = true;

      isHeartAnimation = true;
      incrementCounter();
    }
  }

  bool isFavourite = false;

  deleteProduct(index) {
    savePost.removeAt(index);
  }
}
