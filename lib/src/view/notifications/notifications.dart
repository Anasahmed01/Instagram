import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/view/notifications/notification_viewmodel.dart';
import 'package:instagram/src/view/notifications/widget/widget.dart';
import 'package:stacked/stacked.dart';

class NotificetionView extends StatelessWidget {
  const NotificetionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NotificetionViewModel(),
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
                text: 'Notifications', size: 18, fontWeight: FontWeight.w600),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                  child: CustomText.customSizedText(
                    text: 'Today',
                    fontWeight: FontWeight.w600,
                    size: 18,
                  ),
                ),
                ListView.builder(
                  itemCount: viewModel.today.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 5, color: AppColors.blackColor),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(viewModel.today[index]),
                          ),
                        ),
                      ),
                      title: CustomText.customSizedText(
                          text: viewModel.notificationData[index],
                          fontWeight: FontWeight.w500,
                          size: 16),
                      subtitle: RichText(
                        text:
                            TextSpan(text: 'started following you.', children: [
                          TextSpan(
                            text: '   3h',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ]),
                      ),
                      trailing: const IsFollow(),
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 5.0, top: 20, bottom: 20),
                  child: CustomText.customSizedText(
                    text: 'Yesterday',
                    fontWeight: FontWeight.w600,
                    size: 18,
                  ),
                ),
                ListView.builder(
                  itemCount: viewModel.today.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 5, color: AppColors.blackColor),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(viewModel.today[index]),
                          ),
                        ),
                      ),
                      title: CustomText.customSizedText(
                          text: viewModel.notificationData[index],
                          fontWeight: FontWeight.w500,
                          size: 16),
                      subtitle: RichText(
                        text:
                            TextSpan(text: 'started following you.', children: [
                          TextSpan(
                            text: '   3h',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ]),
                      ),
                      trailing: const IsFollow(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
