import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/toole_tip.dart';
import 'package:instagram/src/view/chat_section/all_chats/all_chats_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../reuseable_widget/custom_text.dart';
import 'widget/all_chats_found.dart';

class AllChatsView extends StatelessWidget {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.getStory();
        viewModel.init();
      },
      viewModelBuilder: () => AllChatsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 45,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: GestureDetector(
                  onTap: () => viewModel.navigateToBack(),
                  child: const Icon(Icons.arrow_back)),
            ),
            title: CustomText.customSizedText(
                text: 'anasahmedyt_official',
                size: 18,
                minFontSize: 18,
                fontWeight: FontWeight.w600),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () => viewModel.navigateToDrawerView(),
                  child: const Icon(
                    Icons.menu_rounded,
                    size: 35,
                  ),
                ),
              ),
              popUp(
                popUpIcon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.trending_up_sharp,
                    size: 35,
                  ),
                ),
              ),
              popUp(
                popUpIcon: const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.edit_square,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          body: allChatsFound(
              viewModel: viewModel, model: viewModel.getPostData!),
        );
      },
    );
  }
}
