import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/src/reuseable_widget/toole_tip.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import '../../../../reuseable_widget/custom_text.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../home/home_viewmodel.dart';

Widget socialButton(
    {required String name,
    required Color color,
    required double height,
    double? size}) {
  return Container(
    height: height,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 8),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: CustomText.customSizedText(
      size: size ?? 14,
      minFontSize: size ?? 14,
      fontWeight: FontWeight.w500,
      text: name,
    ),
  );
}

class UserProfBottomSheet extends StatelessWidget {
  final String userName;
  final String userImage;
  const UserProfBottomSheet(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          height: 380,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  userProListTile(
                    onTab: () => viewModel.navigateToAboutAccountView(
                        userName: userName, userImage: userImage),
                    title: 'About this account',
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(const ClipboardData(
                          text:
                              "https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA=="));
                      // copied successfully

                      viewModel.isCopied = true;
                      viewModel.rebuildUi();
                    },
                    child: userProListTile(
                      title: viewModel.isCopied == true
                          ? 'Copied'
                          : 'Copy profile URL',
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Share.share(
                          'https://www.instagram.com/anasahmedyt_official?igsh=MXIycmdwbDViNXVveA==',
                        );
                      },
                      child: userProListTile(title: 'Share this profile')),
                  popUp(
                    popUpIcon: userProListTile(
                      // onTab: () => Navigator.pop(context),
                      title: 'Ristricted',
                      color: Colors.red,
                    ),
                  ),
                  popUp(
                    popUpIcon: userProListTile(
                      title: 'Block',
                      color: Colors.red,
                    ),
                  ),
                  userProListTile(
                    onTab: () => Navigator.pop(context),
                    title: 'Report',
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget userProListTile({
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 15),
    onTap: onTab,
    title: CustomText.customSizedText(
      text: title,
      size: 15,
      color: color,
      minFontSize: 15,
      maxFontSize: 15,
    ),
  );
}
