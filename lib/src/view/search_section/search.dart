import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/src/reuseable_widget/app_textfield.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/view/search_section/search_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: viewModel.memories.length,
                        (context, index) {
                      return GestureDetector(
                        onTap: () => viewModel.navigateToExploreImageView(
                            userImage: viewModel.memories[index], userName: ''),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(viewModel.memories[index]))),
                        ),
                      );
                    }),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      pattern: const [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // GridView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: viewModel.memories.length,
          //   gridDelegate:
          //       const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 1,
          //     crossAxisSpacing: 1,
          //   ),
          //   itemBuilder: (BuildContext context, index) {
          //     return Image.asset(
          //       viewModel.memories[index],
          //       fit: BoxFit.cover,
          //     );
          //   },
          // ),
          floatingActionButton: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: CustomTextFields.aAppTextField(
                  readOnly: true,
                  onPressed: () => viewModel.navigateToExploreView(),
                  textInputAction: TextInputAction.search,
                  prefixIcon: Icons.circle_outlined,
                  prefixIconColor: Colors.blue.shade400,  
                  hintText: 'Ask Meta AI or Search')),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        );
      },
    );
  }
}
