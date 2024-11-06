import 'package:flutter/material.dart';
import 'package:instagram/src/view/search_section/explore/explore_viewmodel.dart';
import 'package:instagram/src/view/search_section/explore/widget/explore_found.dart';
import 'package:instagram/src/view/search_section/explore/widget/widget.dart';
import 'package:stacked/stacked.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ExploreViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.init();
        viewModel.getStory();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: AppBar(
              title: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: cusForExpAppTextField(
                    // readOnly: true,

                    onChanged: (value) => viewModel.runFilter(value),
                    textInputAction: TextInputAction.search,
                    prefixIcon: Icons.circle_outlined,
                    prefixIconColor: Colors.blue.shade400,
                    hintText: 'Ask Meta AI or Search',
                    suffixIcon: Icons.abc),
              ),
            ),
            body: exploreFound(
                viewModel: viewModel, model: viewModel.getPostData!));
      },
    );
  }
}
