// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'progress_bar.dart';

class MyStoryBars extends StatelessWidget {
  List<double> percentWatched = [];

  MyStoryBars({super.key, required this.percentWatched});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Flexible(child: MyProgressBar(percentWatched: percentWatched[0])),
          Flexible(child: MyProgressBar(percentWatched: percentWatched[1])),
          Flexible(child: MyProgressBar(percentWatched: percentWatched[2])),
        ],
      ),
    );
  }
}
