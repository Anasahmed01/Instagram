// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'post_viewmodel.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => PostViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            titleSpacing: 25,
            elevation: 0,
            title: const Text(
              'New Post',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            centerTitle: false,
            actions: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      viewModel.navigateToPostDiscriptionView(
                          postImage: viewModel.path[viewModel.mediaIndex]);

                      print(viewModel.path[viewModel.mediaIndex]);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    if (viewModel.mediaList.isNotEmpty)
                      Container(
                        height: MediaQuery.sizeOf(context).width,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          image:
                              viewModel.mediaList.length <= viewModel.mediaIndex
                                  ? null
                                  : DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        viewModel.path[viewModel.mediaIndex],
                                      ),
                                    ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 35,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          viewModel.mediaList.isEmpty
                              ? Text(
                                  '',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(
                                  'Recents',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                          viewModel.mediaList.isEmpty
                              ? Container()
                              : GestureDetector(
                                  onTap: () => viewModel.navigateToCameraView(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            221, 53, 52, 52),
                                        shape: BoxShape.circle),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),

                // if (viewModel.mediaList.isEmpty)
                //   Center(child: CircularProgressIndicator()),
                Expanded(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: viewModel.mediaList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => viewModel.imageSelector(index),
                          child: viewModel.mediaList[index]);
                    },
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

                  // SliverGrid(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (context, index) {
                  //       return GestureDetector(
                  //           onTap: () => viewModel.imageSelector(index),
                  //           child: viewModel.mediaList[index]);
                  //     },
                  //     childCount: viewModel.mediaList.length,
                  //   ),
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 3,
                  //     mainAxisSpacing: 1,
                  //     crossAxisSpacing: 2,
                  //   ),
                  // ),