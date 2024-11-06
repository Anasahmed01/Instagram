import 'package:instagram/src/view/drawer/drawer.dart';
import 'package:instagram/src/view/story/story.dart';
import 'package:instagram/src/view/user/edit_profile/edit_profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../del_model/del_data.dart';
import '../../../model/home_post_model.dart';
import '../../../app/app.locator.dart';
import '../../search_section/explore_image/explore.dart';

class ProfileViewModel extends BaseViewModel {
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

  navigateToStoryView({required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      StoryView(
        personName: userName,
        personImage: userImage,
      ),
    );
  }

  navigateToDrawerView() {
    locator<NavigationService>().navigateWithTransition(
      const DrawerView(),
    );
  }

  navigateToEditProfileView() {
    locator<NavigationService>().navigateWithTransition(
      const EditProfileView(),
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

  HomePostModel? getpostData;
  getPost() async {
    try {
      getpostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }

  bool isCopied = false;
}
