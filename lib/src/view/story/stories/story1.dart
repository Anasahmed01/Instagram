import 'package:flutter/material.dart';
import 'package:instagram/src/utils/images/images.dart';

class MyStory1 extends StatelessWidget {
  const MyStory1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppImages.talhaAnjum),
            fit: BoxFit.fitWidth,
          )),
        ),
      ),
    );
  }
}
