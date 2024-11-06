import 'package:instagram/src/view/chat_section/chat/chat.dart';
import 'package:instagram/src/view/story/story.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../del_model/del_data.dart';
import '../../../model/home_post_model.dart';
import '../../../app/app.locator.dart';
import '../../about_account/about_account.dart';
import '../../search_section/explore_image/explore.dart';

class UserProfileViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  // List memories = [
  //   AppImages.bhuvanBam,
  //   AppImages.fing,
  //   AppImages.foodpanda,
  //   AppImages.me,
  //   AppImages.talhaAnjum,
  //   AppImages.talhaYounus
  // ];

  HomePostModel? getpostData;
  getPost() async {
    try {
      getpostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }

  bool isFollowed = false;

  navigateToChatView({required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      ChatView(
        userName: userName,
        userImage: userImage,
      ),
    );
  }

  navigateToExploreImageView(
      {required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      ExploreImageView(
        userName: userName,
        userImage: userImage,
      ),
    );
  }

  navigateToStoryView({required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      StoryView(
        personImage: userImage,
        personName: userName,
      ),
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

  bool isCopied = false;
}
