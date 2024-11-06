import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import 'about_account_viewmodel.dart';
import 'widget/widget.dart';

class AboutAccountView extends StatelessWidget {
  final String userImage;
  final String userName;
  const AboutAccountView({
    super.key,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AboutAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 60,
            leading: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: const Icon(Icons.arrow_back)),
            ),
            title: CustomText.customSizedText(
                text: 'About this account',
                size: 18,
                fontWeight: FontWeight.w600),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      userImage,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomText.customSizedText(
                    text: userName, fontWeight: FontWeight.w500, size: 16),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text:
                        "To help keep our community authentic, we're showing information about accounts on Instagram. ",
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  TextSpan(
                    text: 'See why this information is important.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(
                            Uri.parse(
                                "https://help.instagram.com/1731078377046291"),
                            mode: LaunchMode.externalApplication);
                      },
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              aboutAccListTile(
                leading: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.white,
                ),
                title: 'Date joined',
                subtitle: 'Augest 2019',
              ),
              aboutAccListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.white,
                ),
                title: 'Account based in',
                subtitle: 'Pakistan',
              ),
            ],
          ),
        );
      },
    );
  }
}
