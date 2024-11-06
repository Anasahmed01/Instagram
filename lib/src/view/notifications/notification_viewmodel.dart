import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/images/images.dart';

class NotificetionViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  List today = [
    AppImages.bhuvanBam,
    AppImages.fing,
  ];
  List notificationData = [
    'bhuvanBam',
    'Fing',
  ];

  bool isFollow = false;
}
