import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/auth/login/login.dart';
import 'package:instagram/src/view/navigation/navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../service/storage/storage_service.dart';

class SplashViewModel extends BaseViewModel {
  String? userEmail = LocalStorageServices.getUserEmail();

  init(BuildContext context) {
    loadImage(AppImages.splashLogo, context);
    if (userEmail != null) {
      Timer(const Duration(seconds: 2), () {
        locator<NavigationService>().replaceWithTransition(
          const NavigationView(),
        );
      });
    } else {
      loadImage(AppImages.splashLogo, context);
      Timer(const Duration(seconds: 2), () {
        locator<NavigationService>().replaceWithTransition(
          const LoginView(),
        );
      });
    }
    // await precacheImage(AssetImage(AppImages.splashLogo), context);
  }

  Future<void> loadImage(String imageUrl, BuildContext context) async {
    try {
      await precacheImage(AssetImage(imageUrl), context);
      print('Image loaded and cached successfully!');
    } catch (e) {
      print('Failed to load and cache the image: $e');
    }
  }
}
