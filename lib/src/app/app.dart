import 'package:instagram/src/view/auth/login/login.dart';
import 'package:instagram/src/view/auth/sign_up/sign_up.dart';
import 'package:instagram/src/view/basic/splash.dart';
import 'package:instagram/src/view/home/home.dart';
import 'package:instagram/src/view/navigation/navigation.dart';
import 'package:instagram/src/view/notifications/notifications.dart';
import 'package:instagram/src/view/user/profile/profile.dart';
import 'package:instagram/src/view/reels/reels.dart';
import 'package:instagram/src/view/search_section/search.dart';
import 'package:instagram/src/view/user/user_profile/user_profile.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: NavigationView),
  MaterialRoute(page: NotificetionView),
  MaterialRoute(page: ReelsView),
  MaterialRoute(page: SearchView),
  MaterialRoute(page: UserProfileView),
  MaterialRoute(page: ProfileView),
], dependencies: [
  Singleton(classType: NavigationService),
])
class App {}
