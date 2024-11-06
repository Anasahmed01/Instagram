import 'package:flutter/material.dart';

import '../../../utils/images/images.dart';

class MyStory2 extends StatelessWidget {
  const MyStory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          AppImages.bhuvanBam,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
