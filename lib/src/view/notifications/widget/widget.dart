import 'package:flutter/material.dart';
import 'package:instagram/src/view/notifications/notification_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';

class IsFollow extends StatelessWidget {
  const IsFollow({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NotificetionViewModel(),
      builder: (context, viewModel, child) {
        return viewModel.isFollow == true
            ? GestureDetector(
                onTap: () {
                  viewModel.isFollow = !viewModel.isFollow;
                  viewModel.rebuildUi();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(221, 53, 52, 52),
                      borderRadius: BorderRadius.circular(10)),
                  child: CustomText.customSizedText(
                      text: 'Following', fontWeight: FontWeight.w600),
                ),
              )
            : GestureDetector(
                onTap: () {
                  viewModel.isFollow = !viewModel.isFollow;
                  viewModel.rebuildUi();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: CustomText.customSizedText(
                      text: 'Follow back', fontWeight: FontWeight.w600),
                ),
              );
      },
    );
  }
}
