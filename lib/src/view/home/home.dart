import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../model/home_post_model.dart';
import 'widget/home_found.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getStory();
        viewModel.getPost();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    toolbarHeight: 60,
                    automaticallyImplyLeading: false,
                    title: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: ImageIcon(
                          AssetImage(AppImages.instagram),
                          size: 130,
                        )),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToNotificationView();
                        },
                        child: const Icon(
                          Icons.favorite_border,
                          size: 26,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () => viewModel.navigateToAllChatsView(),
                        child: const Icon(
                          CupertinoIcons.bolt_horizontal_circle,
                          size: 26,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ];
              },
              body: RefreshIndicator(
                displacement: 10,
                color: AppColors.white,
                backgroundColor: AppColors.blackColor,
                onRefresh: () async {
                  await Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      postData;
                      viewModel.rebuildUi();
                    },
                  );
                },
                child: SingleChildScrollView(
                  child: homeFound(
                      viewModel: viewModel,
                      model: viewModel.getStoryData!,
                      postModel: viewModel.getpostData!),
                ),
              ), 
            ),
          ),
        );
      },
    );
  }
}
