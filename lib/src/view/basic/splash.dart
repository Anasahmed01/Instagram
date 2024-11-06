import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(context),
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 32, 32, 32),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                height: 140,
                alignment: Alignment.bottomCenter,
                child: Image.asset(AppImages.splashLogo),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: Column(
                  children: [
                    CustomText.customSizedText(
                        text: 'from', color: AppColors.greyColor, size: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => RadialGradient(
                            center: Alignment.topCenter,
                            stops: const [.5, 1],
                            colors: [
                              Colors.yellow.shade100,
                              Colors.pink,
                            ],
                          ).createShader(bounds),
                          child: const Icon(
                            CupertinoIcons.infinite,
                            size: 34,
                          ),
                        ),
                        Text(
                          "Meta",
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: <Color>[
                                  Color(0xff6228d7),
                                  Color(0xfff9ce34),
                                  Color(0xffee2a7b),
                                  Color(0xfff9ce34),
                                  Color(0xfff9ce34),
                                  Color(0xff6228d7),
                                  Color(0xfff9ce34),
                                  Color(0xff6228d7),
                                  Color(0xffee2a7b),
                                  Color(0xffee2a7b),
                                ],
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
