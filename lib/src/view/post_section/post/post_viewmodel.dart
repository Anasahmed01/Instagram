// ignore_for_file: override_on_non_overriding_member

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../utils/images/images.dart';
import '../../camera_section/camera.dart';
import '../../navigation/navigation.dart';
import '../post_discription/post_discription.dart';

class PostViewModel extends BaseViewModel {
  List memories = [
    AppImages.me,
    AppImages.bhuvanBam,
    AppImages.talhaAnjum,
    AppImages.talhaYounus,
    AppImages.fing,
    AppImages.foodpanda,
  ];

  // final List mediaList = [];
  // final List<File> path = [];
  // File? mediaFile;
  // int currentPage = 0;
  // int? lastPage;

  // @override
  // fetchNewMedia() async {
  //   lastPage = currentPage;
  //   final PermissionState ps = await PhotoManager.requestPermissionExtend();
  //   if (ps.isAuth) {
  //     List<AssetPathEntity> album =
  //         await PhotoManager.getAssetPathList(type: RequestType.image);
  //     List<AssetEntity> media =
  //         await album[0].getAssetListPaged(page: currentPage, size: 60);

  //     for (var asset in media) {
  //       if (asset.type == AssetType.image) {
  //         final file = await asset.file;
  //         if (file != null) {
  //           path.add(File(file.path));
  //           mediaFile = path[0];
  //         }
  //       }
  //     }
  //     List<Widget> temp = [];
  //     for (var asset in media) {
  //       temp.add(
  //         FutureBuilder(
  //           future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200),
  //               quality: 100),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.done) {
  //               return Stack(
  //                 children: [
  //                   Positioned.fill(
  //                     child: Image.memory(
  //                       snapshot.data!,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             }
  //             return Container();
  //           },
  //         ),
  //       );
  //     }

  //     mediaList.addAll(temp);
  //     currentPage++;
  //     rebuildUi();
  //   }
  // }

  // init() {
  //   fetchNewMedia();
  // }

  // int mediaIndex = 0;

  // imageSelector(int i) {
  //   mediaIndex = i;
  //   mediaFile = path[i];
  //   notifyListeners();
  // }

  final List mediaList = [];
  final List<File> path = [];
  File? mediaFile;
  int currentPage = 0;
  int? lastPage;

  @override
  fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> album = await PhotoManager.getAssetPathList(
          type: RequestType.image, onlyAll: true);
      List<AssetEntity> media =
          await album[0].getAssetListPaged(page: currentPage, size: 60);

      for (var asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            mediaFile = path[0];
          }
        }
      }
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200),
                quality: 100),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        );
      }

      mediaList.addAll(temp);
      currentPage++;
      rebuildUi();
    } else {
      // Handle the case when permission is not granted
      print('Permission not granted');
    }
  }

  init() {
    fetchNewMedia();
  }

  int mediaIndex = 0;

  imageSelector(int i) {
    mediaIndex = i;
    mediaFile = path[i];
    rebuildUi();
    notifyListeners();
  }

  navigateToNavigationView() {
    locator<NavigationService>().navigateWithTransition(
      const NavigationView(),
    );
  }

  navigateToCameraView() {
    locator<NavigationService>().navigateWithTransition(
      const CameraView(),
    );
  }

  navigateToPostDiscriptionView({required postImage}) {
    locator<NavigationService>().navigateWithTransition(
      PostDiscriptionView(
        postImage: postImage,
        cameraImage: '',
      ),
    );
  }
}
