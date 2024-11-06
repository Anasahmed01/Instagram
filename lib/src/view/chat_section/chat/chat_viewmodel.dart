import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/src/view/camera_section/camera.dart';
import 'package:instagram/src/view/user/user_profile/user_profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class ChatViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  ScrollController listController = ScrollController();

  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToCameraView() {
    locator<NavigationService>().navigateWithTransition(
      const CameraView(),
    );
  }

  FocusNode focusNode = FocusNode();
  bool isFocus = false;

  void init() {
    focusNode.addListener(() {
      onfocusChange();
    });
    getOldData();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void onfocusChange() {
    isFocus = focusNode.hasFocus;
    rebuildUi();
  }

  navigateToUserProfileView(
      {required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      UserProfileView(
        userImage: userImage,
        userName: userName,
      ),
    );
  }

  List chats = ['Hi!', "Yes!"];
  List senderChats = ['Hello!', 'Brother'];
  bool isChat = true;

  bool isScrolled = false;
  bool recievedAllData = false;
  getOldData() async {
    listController.addListener(() async {
      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        if (isScrolled == false && recievedAllData == false) {
          isScrolled = true;
          notifyListeners();
          listController.animateTo(
            listController.position.maxScrollExtent + 200,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
          chats;
          isScrolled = false;
          notifyListeners();
        }
      }
    });
  }
}
