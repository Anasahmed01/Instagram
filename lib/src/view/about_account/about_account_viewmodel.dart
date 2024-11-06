import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../del_model/del_data.dart';
import '../../model/home_post_model.dart';

class AboutAccountViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  HomePostModel? getpostData;
  getPost() async {
    try {
      getpostData = HomePostModel.fromJson(HomeDelModel.homePost);
    } catch (e) {
      print(e);
    }
  }
}
