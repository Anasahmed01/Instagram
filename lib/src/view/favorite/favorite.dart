import 'package:flutter/material.dart';
import 'package:instagram/src/view/favorite/favorite_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../del_model/del_data.dart';
import '../../reuseable_widget/custom_text.dart';
import '../../utils/colors/app_colors.dart';
import '../home/widget/bottom_sheet.dart';
import '../home/widget/widget.dart';
import 'widget/widget.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FavoriteViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText.customSizedText(
                text: 'Saved', fontWeight: FontWeight.w500, size: 18),
          ),
          body: savePost.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.customSizedText(
                          text: 'No saved found!',
                          color: AppColors.white,
                          size: 18),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: savePost.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => viewModel.navigateToUserProfileView(
                                userName: savePost[index][1],
                                userImage: savePost[index][0]),
                            child: Card(
                              color: AppColors.blackColor,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 10),
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  savePost[index][0]),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText.customSizedText(
                                              text: savePost[index][1],
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText.customSizedText(
                                              text: 'Your post',
                                              size: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () => bottomSheetX(
                                          context,
                                          PostBottomSheet(
                                            userImage: savePost[index][0],
                                            userName: savePost[index][1],
                                          )),
                                      child: Icon(
                                        Icons.more_vert_outlined,
                                        size: 24,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FavouriteOfList(
                            discription: savePost[index][2].toString(),
                            onTap: () {
                              viewModel.deleteProduct(index);
                              viewModel.rebuildUi();
                            },
                            index: index,
                            postImage: AssetImage(savePost[index][0]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
