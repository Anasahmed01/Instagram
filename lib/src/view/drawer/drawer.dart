import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/app_divider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import 'drawer_viewmodel.dart';
import 'widget/widget.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DrawerViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => viewModel.navigateToBack(),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
            title: CustomText.customSizedText(
              text: 'Settings and activity',
              maxFontSize: 18,
              minFontSize: 18,
              size: 18,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.justify,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 45,
                          child: drawerTextField(
                              textInputAction: TextInputAction.search,
                              prefixIcon: CupertinoIcons.search,
                              prefixIconColor: AppColors.greyColor,
                              hintText: 'Ask Meta AI or Search')),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText.customSizedText(
                          text: 'Your account',
                          size: 14,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          CupertinoIcons.person_crop_circle,
                          size: 28,
                          color: AppColors.white,
                        ),
                        title: CustomText.customSizedText(
                            text: 'Account Center',
                            size: 16,
                            color: AppColors.white),
                        subtitle: CustomText.customSizedText(
                            text:
                                'Password, security, personal details, ad preferences',
                            maxLine: 2,
                            textAlign: TextAlign.start,
                            size: 14,
                            color: AppColors.greyColor),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    'Manage your connected experiencences and account settings across Meta technologies. ',
                                style: TextStyle(color: AppColors.greyColor)),
                            TextSpan(
                              text: 'Learn more',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(
                                      Uri.parse(
                                          "https://help.instagram.com/1731078377046291"),
                                      mode: LaunchMode.externalApplication);
                                },
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                appDivider(
                    thickness: 5, color: const Color.fromARGB(255, 44, 44, 44)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomText.customSizedText(
                            text: 'How you use Instagram',
                            size: 14,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500),
                      ),
                      drawerListTile(
                          onTab: () {
                            viewModel.navigateToFavouriteView();
                          },
                          leading: Icon(
                            Icons.bookmark_border,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Saved'),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            Icons.settings_backup_restore_sharp,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: "Archive"),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            CupertinoIcons.graph_square,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Your activity'),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            CupertinoIcons.bell,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Notifications'),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.white,
                            size: 30,
                          ),
                          title: 'Time spent'),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                appDivider(
                    thickness: 5, color: const Color.fromARGB(255, 44, 44, 44)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                        child: CustomText.customSizedText(
                            text: 'For professionals',
                            size: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyColor),
                      ),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            CupertinoIcons.bolt_horizontal_fill,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: 'Insights'),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            CupertinoIcons.person_crop_circle,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: 'Scheduled content'),
                      drawerListTile(
                          onTab: () => Navigator.pop(context),
                          leading: Icon(
                            Icons.settings_backup_restore_sharp,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: 'Creator tools and controls'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                appDivider(
                  thickness: 5,
                  color: const Color.fromARGB(255, 44, 44, 44),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.customSizedText(
                          text: 'Login', size: 14, color: AppColors.greyColor),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: GestureDetector(
                          onTap: () => viewModel.navigateToSignUpView(),
                          child: CustomText.customSizedText(
                              text: 'Add account',
                              size: 14,
                              color: Colors.blue[500]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => viewModel.logOut(),
                        child: CustomText.customSizedText(
                            text: 'Log out', size: 14, color: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
