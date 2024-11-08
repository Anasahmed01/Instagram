// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  double percentWatched = 0;

  MyProgressBar({super.key, required this.percentWatched});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      lineHeight: 3,
      percent: percentWatched,
      progressColor: Colors.white,
      backgroundColor: Colors.grey[500],
      barRadius: const Radius.circular(10),
    );
  }
}
