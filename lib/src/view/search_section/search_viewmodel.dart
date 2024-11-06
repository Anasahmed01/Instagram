import 'package:instagram/src/view/search_section/explore_image/explore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';
import 'explore/explore.dart';

class SearchViewModel extends BaseViewModel {
  List memories = [
    AppImages.bhuvanBam,
    AppImages.fing,
    AppImages.foodpanda,
    AppImages.me,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.foodpanda,
    AppImages.me,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.foodpanda,
    AppImages.me,
    AppImages.talhaAnjum,
    AppImages.bhuvanBam,
    AppImages.fing,
    AppImages.foodpanda,
    AppImages.me,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.foodpanda,
  ];

  navigateToExploreImageView({
    required String userImage,
    required String userName,
  }) {
    locator<NavigationService>().navigateWithTransition(
      ExploreImageView(
        userImage: userImage,
        userName: userName,
      ),
    );
  }

  navigateToExploreView() {
    locator<NavigationService>().navigateWithTransition(
      const ExploreView(),
    );
  }
}
