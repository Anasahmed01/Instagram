import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../del_model/del_data.dart';
import '../../../model/home_post_model.dart';
import '../../navigation/navigation.dart';

class PostDiscriptionViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();

  String controllerValue = '';
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToNavigationView() {
    locator<NavigationService>().navigateWithTransition(
      const NavigationView(),
    );
  }

  HomePostModel? getpostData;
  getPost() async {
    try {
      getpostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }

  void init() {
    loadList();
  }

  Future<void> loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('dynamicList');
    if (jsonString != null) {
      postData = jsonDecode(jsonString);
    }
  }

  Future<void> saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(postData);
    await prefs.setString('dynamicList', jsonString);
  }

  addToPostData({required postImage}) {
    controllerValue = controller.text.trim();
    var postDiscription = {
      'postImage': postImage,
      'postDiscription': controllerValue
    };
    // _saveList();
    postData.add(postDiscription);
    navigateToNavigationView();

    print(postDiscription);

    print(postData);
  }

  addToCameraPostData({required String cameraPost}) {
    // _saveList();
    controllerValue = controller.text;
    var postDiscription = {
      'postImage': cameraPost,
      'postDiscription': controllerValue
    };
    cameraPostData.add(postDiscription);
    navigateToNavigationView();
  }
}
