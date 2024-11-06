import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/camera_section/camera.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';
import '../../app/app.locator.dart';
import '../user/user_profile/user_profile.dart';

class ReelsViewModel extends BaseViewModel {
  late VideoPlayerController controller;

  // Future<ClosedCaptionFile> _loadCaptions(BuildContext context) async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.vtt');
  //   return WebVTTCaptionFile(
  //       fileContents); // For vtt files, use WebVTTCaptionFile
  // }

  init() {
    controller = VideoPlayerController.asset(
      AppImages.reel1,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        controller.play();
        rebuildUi();
      });
    // controller.setLooping(true);
    controller.addListener(() {
      rebuildUi();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List sliderImg = [
    'assets/images/reels/reel_1.mp4',
    'assets/images/reels/reel_1.mp4',
    'assets/images/reels/reel_1.mp4'
  ];

  navigateToUserProfileView({
    required String userName,
    required String userImage,
  }) {
    locator<NavigationService>().navigateWithTransition(
      UserProfileView(
        userName: userName,
        userImage: userImage,
      ),
    );
  }

  navigateToCameraView() {
    locator<NavigationService>().navigateWithTransition(
      const CameraView(),
    );
  }

  // List isLiked = [false, false, false, false];

  int likeCount = 0;

  bool isLiked = false;
  bool isFollowing = false;
  bool isHeartAnimation = false;

  incrementCounter() {
    if (likeCount <= 1) {
      likeCount++;
      rebuildUi();
    }
  }
}
