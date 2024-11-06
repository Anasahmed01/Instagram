import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import 'stories/story1.dart';
import 'stories/story2.dart';
import 'stories/story3.dart';

class StoryViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();

  clearController() {
    controller.clear();
    rebuildUi();
  }

  int currentStoryIndex = 0;
  final List<Widget> myStories = const [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  navigateToBack() {
    locator<NavigationService>().back();
  }

  List<double> percentWatched = [];

  void init() {
    // initially, all stories haven't been watched yet
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // only add 0.01 as long as it's below 1
      if (percentWatched[currentStoryIndex] + 0.01 < 1) {
        percentWatched[currentStoryIndex] += 0.01;
      }
      // if adding 0.01 exceeds 1, set percentage to 1 and cancel timer
      else {
        percentWatched[currentStoryIndex] = 1;
        timer.cancel();

        // also go to next story as long as there are more stories to go through
        if (currentStoryIndex < myStories.length - 1) {
          currentStoryIndex++;
          // restart story timer
          _startWatching();
        }
        // if we are finishing the last story then return to homepage
        else {
          navigateToBack();
        }
      }

      rebuildUi();
    });
  }

  void onTapDown(TapDownDetails details, BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double dx = details.globalPosition.dx;

    // user taps on first half of screen
    if (dx < screenWidth / 2) {
      // as long as this isnt the first story
      if (currentStoryIndex > 0) {
        // set previous and curent story watched percentage back to 0
        percentWatched[currentStoryIndex - 1] = 0;
        percentWatched[currentStoryIndex] = 0;

        // go to previous story
        currentStoryIndex--;
      }
      rebuildUi();
    }
    // user taps on second half of screen
    else {
      // if there are more stories left
      if (currentStoryIndex < myStories.length - 1) {
        // finish current story
        percentWatched[currentStoryIndex] = 1;
        // move to next story
        currentStoryIndex++;
      }
      // if user is on the last story, finish this story
      else {
        percentWatched[currentStoryIndex] = 1;
      }

      rebuildUi();
    }
  }
}
