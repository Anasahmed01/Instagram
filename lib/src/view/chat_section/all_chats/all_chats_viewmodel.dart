import 'package:instagram/src/model/home_post_model.dart';
import 'package:instagram/src/view/camera_section/camera.dart';
import 'package:instagram/src/view/drawer/drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../del_model/del_data.dart';
import '../../../app/app.locator.dart';
import '../../../utils/images/images.dart';
import '../chat/chat.dart';

class AllChatsViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToChatsView({required String userImage, required String userName}) {
    locator<NavigationService>().navigateWithTransition(
      ChatView(
        userName: userName,
        userImage: userImage,
      ),
    );
  }

  navigateToDrawerView() {
    locator<NavigationService>().navigateWithTransition(
      const DrawerView(),
    );
  }

  navigateToCameraView() {
    locator<NavigationService>().navigateWithTransition(
      const CameraView(),
    );
  }

  List<String> tabs = ['Primary', 'General', 'Channels', 'Request'];

  int selectedTab = 0;
  paymentSelection({required int index}) {
    selectedTab = index;
    notifyListeners();
  }

  List memories = [
    AppImages.bhuvanBam,
    AppImages.fing,
    AppImages.me,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.bhuvanBam,
    AppImages.fing,
    AppImages.talhaAnjum,
    AppImages.talhaYounus
  ];

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
}
