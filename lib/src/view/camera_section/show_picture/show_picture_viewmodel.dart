import 'package:instagram/src/view/navigation/navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class ShowPictureViewModel extends BaseViewModel {
  navigateToNavigationView() {
    locator<NavigationService>().navigateWithTransition(
      const NavigationView(),
    );
  }
}
