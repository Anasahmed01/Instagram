import 'package:instagram/src/view/user/user_profile/user_profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../del_model/del_data.dart';

class FavoriteViewModel extends BaseViewModel {
  navigateToUserProfileView(
      {required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      UserProfileView(
        userImage: userImage,
        userName: userName,
      ),
    );
  }

  deleteProduct(index) {
    savePost.removeAt(index);
  }
}
