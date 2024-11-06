import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/app_textfield.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/view/story/story_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;
import '../../reuseable_widget/custom_text.dart';
import 'widget/story_bars.dart';

class StoryView extends StatelessWidget {
  final String personName;
  final String personImage;
  const StoryView(
      {super.key, required this.personName, required this.personImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => StoryViewModel(),
      builder: (context, viewModel, child) {
        return GestureDetector(
          onTapDown: (details) => viewModel.onTapDown(details, context),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 40,
              automaticallyImplyLeading: false,
            ),
            body: Stack(
              children: [
                // story
                viewModel.myStories[viewModel.currentStoryIndex],

                // progress bar
                MyStoryBars(
                  percentWatched: viewModel.percentWatched,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(personImage))),
                      ),
                      CustomText.customSizedText(text: personName),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: AppColors.white,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
            // bottomNavigationBar:
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Container(
              padding: const EdgeInsets.all(10),
              // color: AppColors.blackColor,
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: CustomTextFields.aAppTextField(
                        controller: viewModel.controller,
                        hintText: 'Send message',
                        hintTColor: AppColors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                      child: Icon(
                    CupertinoIcons.heart,
                    size: 30,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => viewModel.clearController(),
                      child: Transform.rotate(
                        angle: 382 * math.pi / 180,
                        child: const Icon(
                          CupertinoIcons.paperplane,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
