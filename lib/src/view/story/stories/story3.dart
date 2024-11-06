import 'package:flutter/material.dart';
import '../../../utils/images/images.dart';

class MyStory3 extends StatelessWidget {
  const MyStory3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          AppImages.talhaYounus,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
