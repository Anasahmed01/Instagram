// ignore_for_file: unused_local_variable

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'camera_viewmodel.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CameraViewModel(),
      onViewModelReady: (viewModel) => viewModel.initializeCameras(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder<void>(
            future: viewModel.initializationControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                    width: double.infinity,
                    child: CameraPreview(viewModel.controller));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () async {
              try {
                await viewModel.initializationControllerFuture;
                final path = join((await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png');

                final image = await viewModel.controller.takePicture();
                if (!context.mounted) return;

                viewModel.navigateToPostDiscriptionView(
                    imagePath: image.path.toString());
              } catch (e) {
                print('FFFFFFFFFFFFFFFFFF$e');
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.1), width: 5),
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              height: 70,
              width: 70,
            ),
          ),
        );
      },
    );
  }
}
