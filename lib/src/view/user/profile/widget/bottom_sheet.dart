import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/view/user/profile/profile_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;
import '../../../../utils/colors/app_colors.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(15),
          height: 150,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Share.share(
                              'https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA==',
                            );
                          },
                          child:
                              shareContainer(const Icon(Icons.share_outlined))),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText.customSizedText(text: 'Share profile')
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(const ClipboardData(
                              text:
                                  "https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA=="));
                          // copied successfully

                          viewModel.isCopied = true;
                          viewModel.rebuildUi();
                        },
                        child: shareContainer(Transform.rotate(
                            angle: 130 * math.pi / 180,
                            child: const Icon(Icons.link))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      viewModel.isCopied == true
                          ? CustomText.customSizedText(text: 'Copied')
                          : CustomText.customSizedText(text: 'Copy link')
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

Widget shareContainer(icon) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      border: Border.all(color: Colors.grey.shade800),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    child: icon,
  );
}

Future profileBottomSheet(
  BuildContext context,
) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return const ProfileBottomSheet();
    },
  );
}
