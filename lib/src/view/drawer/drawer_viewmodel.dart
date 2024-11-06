import 'package:instagram/src/service/storage/storage_service.dart';
import 'package:instagram/src/view/auth/sign_up/sign_up.dart';
import 'package:instagram/src/view/favorite/favorite.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../auth/login/login.dart';

class DrawerViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToLoginView() {
    locator<NavigationService>().replaceWithTransition(const LoginView());
  }

  navigateToSignUpView() {
    locator<NavigationService>().replaceWithTransition(const SignUpView());
  }

  navigateToFavouriteView() {
    locator<NavigationService>().replaceWithTransition(const FavouriteView());
  }

  bool isLiked = false;

  logOut() {
    LocalStorageServices.deleteUser();
    navigateToLoginView();
  }
}
