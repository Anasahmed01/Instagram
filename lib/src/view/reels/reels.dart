import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/view/reels/widget/options.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'reels_viewmodel.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReelsViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Swiper(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    VideoPlayer(viewModel.controller),
                    const OptionsView(),
                  ],
                );
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                  text: 'Reels',
                  size: 24,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () => viewModel.navigateToCameraView(),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
