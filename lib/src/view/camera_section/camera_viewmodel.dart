import 'dart:io';
import 'package:camera/camera.dart';
import 'package:instagram/src/view/post_section/post_discription/post_discription.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CameraViewModel extends BaseViewModel {
  late List<CameraDescription> cameras;
  late CameraController controller;
  late Future<void> initializationControllerFuture;

  // Asynchronous method to initialize cameras
  Future<void> initializeCameras() async {
    cameras = await availableCameras();
    init();
  }

  void init() {
    controller = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
      fps: 90,
    );
    initializationControllerFuture = controller.initialize();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  navigateToPostDiscriptionView({required String imagePath}) {
    locator<NavigationService>().navigateWithTransition(
      PostDiscriptionView(
        cameraImage: imagePath,
        postImage: File(''),
      ),
    );
  }
}
